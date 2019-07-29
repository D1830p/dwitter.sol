# dwitter.sol
There are two contracts in this project named DweeterFactory and DweeterAccount. I've used many higher level concepts of Solidity programming. Some of them are listed below: 
- *Multiple contract interactions* can be seen as the DweeterFactory contract deploys DweeterAccount and stores information about the user of this platform and maps every deployment (user account) with an ID.
There are many features like getting account information by ID and getting the total number of accounts which are makes a strong link between both the contracts.
- *Use of experimental features in solidity* can be observed in the second line as to return an array of objects or instances can be done by encoding only, which is an experimental feature.
- *Use of assembly* code to convert string to bytes32. [Ref](https://ethereum.stackexchange.com/questions/9142/how-to-convert-a-string-to-bytes32/9152#9152)
- *Use of struct* to store all the tweets by one user.

I'm planning to make more detailed contract for the next course, by adding dedicated dashboard and auditing the contract for improvements.

Factory:-0x56dfc1b1d5bc263224c18c195103fca2cfeab314


Name: Dharti parikh
Enrollment: 101227440
