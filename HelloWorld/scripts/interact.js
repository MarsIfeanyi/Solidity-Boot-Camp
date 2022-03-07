
//We want access to the following on the .env
const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS;

const contract = require("../artifacts/contracts/Hello.sol/HelloWorld.json");/*Loading in the application ABI which is stored in the Helloworld.json in that directory. its basically the interface that tells our script, how do we interact with the contract, what are the methods involved, what are the state variables we have access to*/

// provider - Alchemy, the node provider that gives you Read access to the blockchain
const alchemyProvider = new ethers.providers.AlchemyProvider(network="rinkeby", API_KEY);

// signer - you
const signer = new ethers.Wallet(PRIVATE_KEY, alchemyProvider);//Using as you entry point to sign the contract

// creating contract instance
const helloWorldContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);/** This tells our script that anytmie we are interacting with the helloWorldContract, we are specially interacting at 0x845747aEfc00F74cA6FA6F38152b96A7A68Af244 ie the address of the deployed contract = address in .env */

async function main() {
    const message = await helloWorldContract.message();
    /* .message() is a getter function that is automatically generated on the contract bc the contract state variable(message) is public*/ 
    console.log("The message is: " + message); 
    console.log("Updating the message...");

    const tx = await helloWorldContract.update("Mars is a Full-Stack Blockchain Developer");//Put whatever you want to be updated to inside the ("")
    await tx.wait();//to make sure that the transaction(tx), get mined on the blockchain

    const newMessage = await helloWorldContract.message();
    console.log("The new message is: " + newMessage); 
}

main();