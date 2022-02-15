//          Exercise on Enums
// 1. create an enum for the color of shirts called shirtColor and set it to the options of either RED or WHITE or BLUE
// 2 create a data of shirtColor called defaultChoice which is a constant set to the color BLUE
// 3. create a data of shirtColor called choice and don't initiate the value
// 4. create a function called setWhite which changes the shirt color of shirtColor to white
// 5. create a function getChoice which returns the current choice of shirtColor
// 6. create a function getDefaultChoice which returns the default choice of shirtColor

//               MY SOLUTION

pragma solidity >=0.7.0 <0.9.0;

contract createEnums {
    enum shirtColor {
        RED,
        WHITE,
        BLUE
    }
    shirtColor choice;
    shirtColor constant DefaultChoice = shirtColor.BLUE;

    function setWhite() public {
        choice = shirtColor.WHITE;
    }

    function getChoice() public view returns (shirtColor) {
        return choice;
    }

    function getDefaultChoice() public view returns (uint256) {
        return uint256(DefaultChoice);
    }
}
