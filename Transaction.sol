// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Transfer
{
    address payable wallet;
    mapping(address => uint256) public balance;
    
    
    constructor(address payable _wallet)
    {
        wallet = _wallet;
    }
    
    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address payable receiver, uint amount) public payable
    {
        require(receiver == msg.sender);
        balance[receiver] += amount;
        receiver.transfer(msg.value);
    }
    
    function SendToken(address payable receiver, uint amount) public payable
    {
        balance[wallet] -= amount;
        balance[receiver] += amount;
        wallet.transfer(msg.value);
    }
    
    // who is msg.sender ?
    function WhoisMsgSender() public returns (address)
    {
        return msg.sender;
    }
    
    /*
    function SendToken(address payable _wallet, uint numbers) public payable
    {
        balance[msg.sender] -= numbers;
        _wallet.transfer(msg.value);
    }
    
    function balances(address _account) external view returns (uint)
    {
        return balance[_account];
    }
    */
}
