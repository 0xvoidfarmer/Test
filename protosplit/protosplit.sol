 pragma solidity ^0.4.8;
    
    contract Splitter{
        
        address public first;
        address public second;
        bool    public running;
        
        event LogSenderDeposit(address sender, uint amount);
        event LogSplitFund(uint senderAmount, uint firstAmount, uint secondAmount);
        
        function Splitter(address _first, address _second ) {
            first = _first;
            second = _second;
        }
        
        function split() {
            if(msg.sender.balance <= 0) throw; //check empty address balance
            
        }
        
        
        function switchRunning (bool onOff) public returns( bool sucess){
            running = onOff;
        }
        
        function killContract (){
            selfdestruct;
        }
        
        function deposit () payable {}
        
    }