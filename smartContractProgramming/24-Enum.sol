// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * Enum allows you to express more choices.
 *
 * Hint: In Solidity, an enum is a special data type that allows you to define a set of named constants. An enum is similar to an enumeration in other programming languages.
 *
 * Enums can be useful for defining a set of named constants that have a specific meaning in your contract. For example, you could use an enum to represent the different states of a contract (e.g., "Active", "Inactive", "Expired").
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

    // Creating a varaible called "status" of the enum(Status) type
    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    // Creating a variable called "orders" of the Struct(Order) type
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
