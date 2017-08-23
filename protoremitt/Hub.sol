
pragma solidity ^0.4.6;

import  "./Spawn.sol" ;
import  "./Freezeable.sol";

contract Hub is Freezeable {
     
     address[] public spawns;
     mapping (address => bool) spawnExists;
     
     modifier onlyIfSpawn (address spawnAddress){
         if(spawnExists[spawnAddress] == false) throw;
         _;
     }
     
     event LogNewSpawn(address sponsor, address spwanAddress /*, [type1 arg1, ...typen, argn] spawn specific parameters */);
     
     function getSpawnCount()
        public 
        constant
        returns (uint spawnCount)
    {
        return spawns.length;
    }
    
    function newSpawn(/*[type1 arg1, ...typen, argn] spawn specific parameters*/)
        public 
        returns (address spawnContract)
    {
        
        Spawn trustedSpawn = new Spawn(msg.sender /*, [type1 arg1, ...typen, argn] */ );
        spawns.push(trustedSpawn);
        spawnExists[trustedSpawn] = true;
        LogNewSpawn(msg.sender, trustedSpawn /*,[type1 arg1, ...typen, argn] */ );
        return trustedSpawn;
        
    }
    
    //Pass through Admin Controls
    
    function freezeSpawn(address _spawnAddress)
        onlyOwner
        onlyIfSpawn (_spawnAddress)
        returns (bool success)
    {
        Spawn trustedSpawn = Spawn(_spawnAddress);
        return (trustedSpawn.switchRunningState(true));
    }
    
    function unfreezeSpawn(address _spawnAddress)
        onlyOwner
        onlyIfSpawn(_spawnAddress)
        returns (bool success)
    {
        Spawn trustedSpawn = Spawn(_spawnAddress);
        return (trustedSpawn.switchRunningState(false));
    }
    
    function changeSpawnOwner(address _spawnAddress, address newOwner)
        onlyOwner
        onlyIfSpawn(_spawnAddress)
        returns (bool success)
    {
        Spawn trustedSpawn = Spawn(_spawnAddress);
        return (trustedSpawn.changeOwner(newOwner));
    }
        
        
     
     
}
