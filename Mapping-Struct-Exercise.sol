//       Mapping Assignment:
// 0. Create a unique data type as a struct called Movie and give it the string properties: title and diretor.
// 1. Create a map called movie which takes a uint as a key and Movie as a value
// 2. create a function called addMovie which takes three inputs, movie id, title and director, which
// assigns a value of an integer to a movie added back to the movie map. It should include a title and director name.
// 3. Deploy the contract and update the movie information to the movie map with our favorite movies!

//     MY SOLUTION
pragma solidity >=0.7.0 <0.9.0;

contract createMapping {
    struct Movie {
        string title;
        string director;
    }
    mapping(uint256 => Movie) public movie;

    function addMovie(
        uint256 _id,
        string memory title,
        string memory director
    ) public {
        //Assigning integer ie key to the movie map ie values
        movie[_id] = Movie("title", "director");
    }
}
