//      Exercise on Structs

/*1. create a struct called Movie and add director variable add movie title variable add movie id variable
 create a fuction called setMovie that is publicly visible
 2. create a new variabel called comedy and set up comedy to the datatype Movie 
3. update the setMovie function with a comedy that contain name, director, and an id
4. create a getMovie function that return the movie id of the comedy. */

//      MY SOLUTION
pragma solidity >=0.7.0 <0.9.0;

contract createStructs {
    struct Movie {
        string director;
        string title;
        uint256 movie_id;
    }
    Movie comedy;

    function setMovie() public {
        comedy = Movie("Mars", "Do Hard things", 3);
    }

    function getMovie() public view returns (uint256) {
        return comedy.movie_id;
    }
}
