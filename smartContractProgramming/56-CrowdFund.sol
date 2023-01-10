// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Crowd fund ERC20 token

- User creates a campaign.
- Users can pledge, transferring their token to a campaign.
- After the campaign ends, campaign creator can claim the funds if total amount pledged is more than the campaign goal.
- Otherwise, campaign did not reach it's goal, users can withdraw their pledge.
 */

interface IERC20 {
    function transfer(address, uint) external returns (bool);

    function transferFrom(address, address, uint) external returns (bool);
}

contract CrowdFund {
    event Launch(
        uint id,
        address indexed creator,
        uint goal,
        uint32 startAt,
        uint32 endAt
    );
    event Cancel(uint id);
    event Pledge(uint indexed id, address indexed caller, uint amount);
    event Unpledge(uint indexed id, address indexed caller, uint amount);
    event Claim(uint id);
    event Refund(uint id, address indexed caller, uint amount);

    struct Campaign {
        // Creator of campaign
        address creator;
        // Amount of tokens to be raised, for campaign to be successful
        uint goal;
        // Total amount of token pledged
        uint pledged;
        // Timestamp of start of campaign
        uint32 startAt;
        // Timestamp of end of campaign
        uint32 endAt;
        // True if goal was reached and creator has claimed the tokens.
        bool claimed;
    }

    // defining the type of allowed token
    IERC20 public immutable token;
    // Total count of campaigns created.
    // It is also used to generate id for new campaigns.
    uint public count;
    // Mapping from id to Campaign
    mapping(uint => Campaign) public campaigns;
    // Mapping from campaign id => pledger => amount pledged... This helps to know how much amount of token each user has Pledge to the campaign
    mapping(uint => mapping(address => uint)) public pledgedAmount;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function launch(uint _goal, uint32 _startAt, uint32 _endAt) external {
        require(_startAt >= block.timestamp, "start at < now"); // _startAt should be greater or equal to the current time stamp.
        require(_endAt >= _startAt, "end at < start at");
        require(_endAt <= block.timestamp + 90 days, "end at > max duration"); // _endAt should be less than or equal to current timestamp + 90 days from now.

        // storing the inputs in a new Campaign struct
        count += 1;
        campaigns[count] = Campaign({
            creator: msg.sender,
            goal: _goal,
            pledged: 0,
            startAt: _startAt,
            endAt: _endAt,
            claimed: false
        });

        emit Launch(count, msg.sender, _goal, _startAt, _endAt);
    }

    // function that allows the campaign creator to cancel campaign if the campaign has started
    function cancel(uint _id) external {
        // create/get the Campaign
        Campaign memory campaign = campaigns[_id]; // Campaign memory campaign is equal campaign from the mapping
        require(campaign.creator == msg.sender, "not creator");
        require(block.timestamp < campaign.startAt, "started");
        // if the above two conditoins are met, then go ahead and delete the campaign
        delete campaigns[_id];
        emit Cancel(_id);
    }

    // function that allows users to pledge to a campaign (by specifying the amount of token the want to plege) once a campaign starts.
    function pledge(uint _id, uint _amount) external {
        // gets the Campaign and store it in the "campaign" variable as storage
        Campaign storage campaign = campaigns[_id]; // Hint: here we are declaring it as storage because we are going to update the Campaign struct
        require(block.timestamp >= campaign.startAt, "not started");
        require(block.timestamp <= campaign.endAt, "ended");

        // Updating the Campaign struct by adding amount
        campaign.pledged += _amount; //Hint: Pledged, holds the total amount of token that has been transfered to this campaign

        // updating the pledgedAmount mapping... once the campaign ends and lets say the campaign was not successful then the user can be able to withdraw the token that they pledged
        pledgedAmount[_id][msg.sender] += _amount; // update the mapping
        token.transferFrom(msg.sender, address(this), _amount);

        emit Pledge(_id, msg.sender, _amount);
    }

    // functions that allows users to Unpledge their initial Pledge
    function unpledge(uint _id, uint _amount) external {
        // gets the Campaign and store it in the "campaign" variable as storage
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp <= campaign.endAt, "ended"); // users shouldn't be able to Unpledge on a campaign that has ended

        campaign.pledged -= _amount; // update the campaign struct by removing amount
        pledgedAmount[_id][msg.sender] -= _amount; // update the mapping by removing _amount
        token.transfer(msg.sender, _amount);

        emit Unpledge(_id, msg.sender, _amount);
    }

    // function that allows the campaign creator to claim the tokens, if and only if the total plege is greater than the campaign goals ie campaign is successful
    function claim(uint _id) external {
        // gets the Campaign and store it in the "campaign" variable as storage
        Campaign storage campaign = campaigns[_id];
        require(campaign.creator == msg.sender, "not creator");
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged >= campaign.goal, "pledged < goal");
        require(!campaign.claimed, "claimed");

        campaign.claimed = true;
        token.transfer(msg.sender, campaign.pledged); // Hint: we used msg.sender here because it is more gas efficient than calling campaign.creator

        emit Claim(_id);
    }

    // function that allows users to get refunded, if the campaign is not successful ie when total pledge is less than campaign goals.
    function refund(uint _id) external {
        Campaign memory campaign = campaigns[_id];
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged < campaign.goal, "pledged >= goal");

        uint bal = pledgedAmount[_id][msg.sender];
        // reset the pledgedAmount before transfering... This is to prevent reentrancy
        pledgedAmount[_id][msg.sender] = 0;

        token.transfer(msg.sender, bal);

        emit Refund(_id, msg.sender, bal);
    }
}
