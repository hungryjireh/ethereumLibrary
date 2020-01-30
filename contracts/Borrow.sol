pragma solidity ^0.5.0;

contract Borrow {
    address[16] public borrowers;

    event LogBorrowed(uint bookId);

    function borrowBook(uint bookId) public returns (uint) {
        require(bookId >= 0 && bookId <= 15);
        require(borrowers[bookId] == 0x0000000000000000000000000000000000000000);
        borrowers[bookId] = msg.sender;
        emit LogBorrowed(bookId);
        return bookId;
    }

    function getBorrowers() public view returns (address[16] memory) {
        return borrowers;
    }
}