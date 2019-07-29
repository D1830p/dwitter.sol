pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

contract DweeterFactory {
    mapping (address => DweeterAccount) accounts;
    mapping (uint => address) ids;
    uint numberOfAccounts;
    
    constructor () public {
        numberOfAccounts = 0;
    }
    
    function register() public {
        accounts[msg.sender] = new DweeterAccount(msg.sender);
        ids[numberOfAccounts] = msg.sender;
        numberOfAccounts++;
    }
    
    function getAccount(address _adr) public returns (DweeterAccount account) {
        return (accounts[_adr]);
    }
    
    function getAccountById(uint id) public returns (DweeterAccount account) {
        return (accounts[ids[id]]);
    }
    
    function getAccountsCount() public returns (uint nb) {
        return (numberOfAccounts);
    }
}

contract DweeterAccount {
    struct Dweet {
       string post;
       uint time;
    }
    
    uint dweetsCount;
    address owner;
    mapping (uint => Dweet) DweetsWithId;
    
    modifier onlyOwner() {
        require( owner == msg.sender, 'Unauthorized access!');
        _;
    }
    
    constructor(address _owner) public {
        owner = _owner;
        dweetsCount = 0;
    }
    
    function getDweets() public view returns(Dweet[] memory) {
        Dweet[] memory result = new Dweet[](dweetsCount);
        for(uint i = 0; i < dweetsCount; i++ ) {
            result[i] = DweetsWithId[i];
        }
        return result;
    }
    
    function postDweets(string memory _post) public onlyOwner {
        bytes32 postString = stringToBytes32(_post);
        require(postString.length <=100, 'Characters limit exceeded!');
        DweetsWithId[dweetsCount].post = _post;
        DweetsWithId[dweetsCount].time = now;
        dweetsCount++;
    }
    
    function getDweetById(uint _id) public returns(string memory post, uint time) {
        require(_id < dweetsCount, 'Dweet does not exist!');
        post = DweetsWithId[_id].post;
        time = DweetsWithId[_id].time;
    }
    
    function stringToBytes32(string memory source) internal returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        
        assembly {
            result := mload(add(source, 32))
        }
    }
    
    function getOwnerAddress() public returns (address _owner) {
        return owner;
    }
     
      function getDweetsCount() public returns (uint _dweetsCount) {
        return dweetsCount;
      }
}
