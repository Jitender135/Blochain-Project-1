// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Transactions {
    uint256 public transactionCount;

    // Event to emit whenever a transfer occurs
    event Transfer(
        address indexed from,
        address indexed receiver,
        uint256 amount,
        string message,
        uint256 timestamp,
        string keyword
    );

    // Struct to hold transfer data
    struct TransferStruct {
        address sender;
        address receiver;
        uint256 amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    // Array to store all transactions
    TransferStruct[] public transactions;

    // Function to add a transaction to the blockchain
    function addToBlockchain(
        address payable receiver,
        uint256 amount,
        string memory message,
        string memory keyword
    ) public payable {
        require(amount > 0, "Amount must be greater than 0.");
        require(msg.value == amount, "Amount mismatch with transaction value.");

        transactionCount += 1;

        // Store the transaction
        transactions.push(
            TransferStruct(
                msg.sender,
                receiver,
                amount,
                message,
                block.timestamp,
                keyword
            )
        );

        // Emit the Transfer event
        emit Transfer(
            msg.sender,
            receiver,
            amount,
            message,
            block.timestamp,
            keyword
        );

        // Transfer the amount to the receiver
        receiver.transfer(amount);
    }

    // Function to retrieve all transactions
    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return transactions;
    }

    // Function to retrieve the total number of transactions
    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}
