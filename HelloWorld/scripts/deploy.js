
async function main() {
    const HelloWorld = await ethers.getContractFactory("HelloWorld");/*Loading the smart contract,that we compiled.
    ethers = comes from the hardhat config, where we require ether from the plugin that we installed.
    "HelloWorld" = Is found inside the artifacts, contracts/HelloWorld.json, it contains the ABI of the compiled smart contract and hardhat uses it to get the ContractFactory.
    HelloWorld = Factory for creating instances of the the "HelloWorld" Contract that we can interact with*/
 

    // Start deployment, returning a promise that resolves to a contract object
    const hello_world = await HelloWorld.deploy("Hello World!"); /*Actual instance of the contract
    "Hello World!" = initMessage we defined in our constructor*/

    console.log("Contract deployed to address:", hello_world.address);//To check/see the address where the contract was deployed
 }
 
 main()//Calling the main function
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });