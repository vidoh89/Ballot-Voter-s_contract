//SPDX-License-Identifier:MIT

/**
*Function explanations
1.event()=> Helps to track smart contract activity. Declares and records specific occurrencies in smart contract.
  Also, creates a permanent record which is stored on the blockchain when emmitted.

2.struct{} => Helps group data together.Structures multiple variables under a single name.
 */

pragma solidity >=0.4.0 <0.9.0;

contract Transactions{
    //Counter variable for transactions
    uint256 transactionCount;
    //event Transfers
    event Transfers(address from, address receiver, uint amount, string message,uint256 timestamp, string keyword);
    //Structure variable data
    struct TransactionStruct{
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }
    //Set TransferStruct[] to variable-creates a central location 
    // to store and manage a collection of transactions.
    TransactionStruct[] transactions;

    function addToBlockchain(address payable receiver, uint amount,string memory message,string memory keyword )public {
        transactionCount +=1;
        transactions.push(TransactionStruct(msg.sender,receiver,amount,message,block.timestamp,keyword));
        emit Transfers(msg.sender,receiver,amount,message,block.timestamp,keyword);
    }
    function getAllTransactions()public view returns(TransactionStruct[] memory){
        return transactions;
    }
    function getTransactionCount()public view returns(uint256){
        return transactionCount;
    }


}