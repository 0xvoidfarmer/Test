pragma solidity ^0.4.12;

contract Owned {
    address owner;
    
    modifier onlyOwner { if(msg.sender != owner) throw;  _;}
    event LogNewOwner(address oldOwner, address newOwner);
    
    
    function Owned() {
        owner = msg.sender;
    }
    
    function  changeOwner(address newOwner) 
        onlyOwner
        returns (bool success)
    {
        if (newOwner == address(0)) throw;
        LogNewOwner(owner, newOwner);
        owner = newOwner;
        return true;
    }
}
