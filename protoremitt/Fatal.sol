pragma solidity ^0.4.6;

import "./Owned.sol";

contract Fatal is Owned {
    
     function Fatal() {
         
     }
     
     function kill(address contractAddress)
        onlyOwner
     {
         suicide(contractAddress);
     }
     
     function(){}
}
