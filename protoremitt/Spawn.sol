pragma solidity ^0.4.6;

import  "./Freezeable.sol";

contract Spawn is Freezeable  {
    
    address owner;
    
    function Spawn(address spwanAddress) {
        owner = spwanAddress;
    }
    
    function () {}
}
