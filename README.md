# Dwitter
There are two contracts in this project named DweeterFactory and DweeterAccount. I've used many higher level concepts of Solidity programming. Some of them are listed below: 
- *Multiple contract interactions* can be seen as the DweeterFactory contract deploys DweeterAccount and stores information about the user of this platform and maps every deployment (user account) with an ID. There are many features like getting account information by ID and getting the total number of accounts which are makes a strong link between both the contracts.
- *Use of experimental features in solidity* can be observed in the second line as to return an array of objects or instances can be done by encoding only, which is an experimental feature.
- *Use of assembly* code to convert string to bytes32. [Ref](https://ethereum.stackexchange.com/questions/9142/how-to-convert-a-string-to-bytes32/9152#9152)
- *Use of struct* to store all the tweets by one user.

To use the contract, you can deploy DweeterAccount and use all of its functions individually. It represents one account and all the tweets by that account, stored in a struct with post and timestamp. Functions of DweeterAccount contract are listed below:
```JS
function getDweets() public view returns(Dweet[] memory)
function postDweets(string memory _post) public onlyOwner
function getDweetById(uint _id) public returns(string memory post, uint time)
function stringToBytes32(string memory source) internal returns (bytes32 result)
function getOwnerAddress() public returns (address _owner)
function getDweetsCount() public returns (uint _dweetsCount) 
```

The DweeterFactory contract has been deployed already and it is working as expected. To verify you can follow the steps below:
1. Call `function getAccountsCount() public returns (uint nb)`, and see the response should be something like this
```JSON 
{
    "0": "uint256: nb 1"
}
```
2. Call ` function register() public` with any account (ex. `0xc196...85`)
3. Call `function getAccountsCount() public returns (uint nb)` again, and see the response should be something like this (added 1 to count)
```JSON 
{
    "0": "uint256: nb 2"
}
```
4. Call the `function getAccountById(uint id) public returns (DweeterAccount account)` with the last count-1 as parameter (1 in the example case) and you should get a response with the address you registered with. for ex: 
```JSON
{
    "0": "address: account 0xc196...85"
}
```

I'm planning to make more detailed contract for the next course, by adding dedicated dashboard and auditing the contract for improvements. In the next course I'll implement getDweets, postDweets, getDweetById, getUserAddress, getDweetsCountForUser functions using Dashboard. For the sake of this course I've managed to implement communication between multiple contracts.


Address is on Ropsten Testnet
Factory:-0x56dfc1b1d5bc263224c18c195103fca2cfeab314


Name: Dharti parikh
Enrollment: 101227440
