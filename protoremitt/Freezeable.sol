pragma solidity ^0.4.6;

import "./Owned.sol";

contract Freezeable is Owned {
    
    bool public running;
    
    event LogOnOffSwitch(address sender, bool switchState);
    
    modifier onlyIfRunning {
        if(running == false) throw;
        _;    
    }
    
    
    function Freezeable() {
        running = true;
    }
    
    function switchRunningState(bool onOff)
        onlyOwner
        returns (bool success)
    {
        running = onOff;
        LogOnOffSwitch(msg.sender, onOff);
        return true;
    }
    
    function () {}
    
}
