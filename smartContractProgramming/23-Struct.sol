// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 *  Structs allow you to group data together.
 *
 * Hint:In Solidity, a struct is a user-defined type that allows you to store a collection of different data types under one name. A struct is similar to a class in other programming languages.
 */

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    //Using the struct as a state variable

    Car public car;
    Car[] public cars; // Array of Structs
    mapping(address => Car[]) public carsByOwner; // Mapping of array of sturcuts

    /**
     * HOW to Initialize a struct
     *
     * There are 3 ways to initialize a strucrture:
     *
     * 1. Calling it like a function or method ie put all the parameters into parenthesis
     * 2. Passing the key-value pair inside the parenthensis.
     * 3. Defining the struct with default values
     */

    function examples() external {
        // 1.
        Car memory toyota = Car("Toyota", 1990, msg.sender); //Hint: Here the order is important

        // 2.
        Car memory lambo = Car({
            model: "Lamborghini",
            year: 1980,
            owner: msg.sender
        }); // Here the order is not important

        // 3
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        // Pushing the structs to the cars array so that it will be stored as a state variable

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        //Hint: You can also initialize a struct and push the values directly

        cars.push(Car("Ferrari", 2020, msg.sender));

        // getting the first car that is stored in the cars array
        //Hint: If you want want to get the cars variable and Read it , no modification, then you can declare the cars as memory however if you need modification then declare as storage

        Car memory _car = cars[0];
        //getting the various values for the first car
        _car.model;
        _car.year;
        _car.owner;

        //Hint: If you modify anything in memory, then when the function is done executing, nothing is saved.Thus is best to use storage when you want to modify the data

        Car storage _car2 = cars[0];
        _car2.year = 1999; // Updating the year

        // Resets the data
        delete _car.owner;

        delete cars[1];
    }
}
