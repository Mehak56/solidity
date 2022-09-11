// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.22 <0.9.0;

contract Deposit {
    mapping (address => uint256) depositors;
    uint counter;

    constructor() {
        counter = 0;
    }
    function deposit() public payable {
        require(msg.value >= 1 ether,"The minimum amount entered should be 1 ether");
        depositors[msg.sender] += msg.value;
    }

    function recieve() external  payable {
        deposit();
    }

    function withdrawal() public {
        require(depositors[msg.sender] > 0,"You have not deposited any ether");
        if(counter == 0) {
            payable(msg.sender).transfer((depositors[msg.sender] / 100) * 90);
        }
        else if(counter == 1) {
            payable(msg.sender).transfer((depositors[msg.sender] / 100) * 80);
        }
        else if(counter == 2) {
            payable(msg.sender).transfer((depositors[msg.sender] / 100) * 70);
        }
        depositors[msg.sender] = 0;
        counter += 1;
    }
}
