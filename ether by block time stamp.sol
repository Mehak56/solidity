/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract etherses{
  mapping(address => uint) public balances;
  uint public start;
  constructor ()
  {
      start = block.timestamp;
  }  

  function deposit() payable public{
      require(msg.value >= 1 ether, "Insufficient amount");
      balances[msg.sender] += msg.value;
  } 
  function recieve()external payable{
      deposit();
  }

  function withdraw()public {
      require(depositors[msg.sender]>0,"you not to deposite ether");
      if(block.timestamp>=start+5 minutes){
            payable(msg.sender).transfer((depositors[msg.sender] / 100) * 90);
        }
        else if(block.timestamp>=start+2 minutes) {
            payable(msg.sender).transfer((depositors[msg.sender] / 100) * 80);
        }
        else if(block.timestamp>=start+1 minutes) {
            payable(msg.sender).transfer((depositors[msg.sender] / 100) * 70);
        }
        depositors[msg.sender] = 0;
  }
}
