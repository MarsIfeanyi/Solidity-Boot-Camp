// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * Enum allows you to express more choices
 */

contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    // Using the enum as a state variable
    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    //How to return an enum from a function
    function get() external view returns (Status) {
        return status;
    }

    //How to take enum as input
    function set(Status _status) external {
        status = _status;
    }

    // How to update enum
    function ship() external {
        status = Status.Shipped;
    }

    // Resetting enum to default value... Hint: The default value of an enum is the first value that is defiend inside the curly braces, thus here it is "None"
    function reset() external {
        delete status;
    }
}
