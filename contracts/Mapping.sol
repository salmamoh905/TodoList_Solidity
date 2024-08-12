// SPDX-License-Identifier:
pragma solidity ^0.8.0;

///smart contract for booking hotel rooms

// contract HotelRoom{
//     //Ether payments
//     //Modifiers
//     //Visisbility
//     //Events
//     //Enum

//     //creating enum
//     enum Statuses{ Vacant, Occupied}
//     Statuses currentStatus;
//     //create the payble address
//     address payable public owner;
//     //a constructor to assign the sender to the owner

//     //Events
//     event occupy (address _occupant, uint _value);

//     constructor () public {
//         owner = msg.sender;
//         currentStatus = Statuses.Vacant;
//     }

//     //modifiers
//     modifier onlyWhileVacant{
//         require (currentStatus == Statuses.Vacant, 'Currently Occupied');
//         _;
//     }
//     modifier costs(uint _amount){
//         require(msg.value >= _amount, 'Not enough ether provided');
//         _;
      
//     }
//     function book () payable public onlyWhileVacant() costs(2 ether) {
//         //sending the ether: modifiers
        
//         currentStatus = Statuses.Occupied;
//        // owner.transfer(msg.value);

//         (bool sent, bytes memory data) = owner.call{value: msg.value}('');
//         require (true);

//         emit occupy(msg.sender, msg.value);
//     }
// }


//INHERITANCE 
//FACTORIES
//INTERACTION

contract Ownable{
     address public owner;

    modifier onlyOwner (){
        require (msg.sender == owner, 'Only owner can call this function');
        _;
    }
    constructor () public {
        owner = msg.sender;
        
    }
}

contract SecretVault{
    string secret;
     constructor (string memory _secret) public {
          secret = _secret;

    }

    function getSecret() public view  returns( string memory){
        return secret;
    }
}

contract MyContract is Ownable{
    address secretVault;
   
    constructor (string memory _secret) public {
       super ;
       SecretVault _secretVault = new SecretVault(_secret);
       secretVault = address(_secretVault);

    }

    function getSecret() public view onlyOwner returns( string memory){
        return secretVault(secretVault).getSecret();
    }
}
