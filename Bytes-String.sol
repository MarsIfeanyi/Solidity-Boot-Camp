//           Exercises with Strings (string to bytes Conversion)
// 1. create a string called favoriteColor
// 2. set the favorite color of the string favoriteColor to blue
// 3. create a function which returns the string literal of favoriteColor
//4 . create a function which changes the favoriteColor string literal from blue to your favorite color.
//5 . create a function which can return how many characters there are in the string favorite color

//   MY SOLUTION
pragma solidity >=0.7.0 <0.9.0;

contract bytesToString {
    string favoriteColor = "blue";

    function getFavoriteColor() public view returns (string memory) {
        return favoriteColor;
    }

    function changeFavoriteColor(string memory _yourColor) public {
        favoriteColor = _yourColor;
    }

    function lengthFavoriteColor() public view returns (uint256) {
        //string to bytes conversion so as to get the length of string
        bytes memory stringToBytes = bytes(favoriteColor);
        return stringToBytes.length;
    }
}
