// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Payable {
    // Payable address can receive Ether
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    function transfer(address payable _to, uint _amount) public {

        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}
