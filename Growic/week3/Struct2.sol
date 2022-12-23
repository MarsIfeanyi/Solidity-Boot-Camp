// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Struct {
    struct Food {
        string name;
        string typeFood;
        uint amount;
    }

    // Declaring variable and array of the type struct
    Food public food;
    Food[] public foods;

    // Updating the struct
    function sushi() external {
        Food memory _food = Food({
            name: "sushi",
            typeFood: "handroll",
            amount: 9
        });
        foods.push(_food);
    }

    // Another way of updating the struct
    function rice() external {
        Food memory _food;

        _food.name = "Rice";
        _food.amount = 400;
        _food.typeFood = "carbs";

        foods.push(_food);
    }
}
