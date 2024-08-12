// SPDX-License-Identifier:
pragma solidity ^0.8.0;

///smart contract for booking hotel rooms

contract HotelRoom{
    //Ether payments
    //Modifiers
    //Visisbility
    //Events
    //Enum

    //creating enum
    enum Statuses{ Vacant, Occupied}
    Statuses currentStatus;
    //create the payble address
    address payable public owner;
    //a constructor to assign the sender to the owner

    //Events
    event occupy (address _occupant, uint _value);

    constructor () public {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }

    //modifiers
    modifier onlyWhileVacant{
        require (currentStatus == Statuses.Vacant, 'Currently Occupied');
        _;
    }
    modifier costs(uint _amount){
        require(msg.value >= _amount, 'Not enough ether provided');
        _;
      
    }
    function book () payable public onlyWhileVacant() costs(2 ether) {
        //sending the ether: modifiers
        
        currentStatus = Statuses.Occupied;
       // owner.transfer(msg.value);

        (bool sent, bytes memory data) = owner.call{value: msg.value}('');
        require (true);

        emit occupy(msg.sender, msg.value);
    }
}