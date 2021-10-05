// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    // new git test
    // The keyword "public" makes variables
    // accessible from other contracts
    address minter;
    mapping(address => uint256) public balances;

    // Constructor code is only run when the contract
    // is created
    constructor() {
        minter = msg.sender;
        //minter = _wallet;
    }

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint256 amount) public {
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint256 amount);

    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint256 amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint256 requested, uint256 available);
}
