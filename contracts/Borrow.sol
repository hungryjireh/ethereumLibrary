pragma solidity ^0.5.0;

contract Borrow {
    bool private emergency = false;
    address private admin;

    uint public bookCount;
    address[16] public borrowers;
    //mapping (uint => address) public borrowers;

    event LogBorrowed(uint bookId);

    modifier onlyAdmin {
        require(msg.sender == admin);
        _;
    }

    modifier stopInEmergency {
        require(!emergency);
        _;
    }

    modifier onlyInEmergency {
        require(emergency);
        _;
    }

    constructor() public {
        //initialize bookCount as 15 (0th index)
        bookCount = 16;
    }


    function toggleEmergency() public onlyAdmin returns (bool) {
        emergency = !emergency;
        return true;
    }

    function borrowBook(uint bookId) public stopInEmergency returns (uint) {
        require(bookId >= 0 && bookId <= bookCount);
        require(borrowers[bookId] == 0x0000000000000000000000000000000000000000);
        borrowers[bookId] = msg.sender;
        emit LogBorrowed(bookId);
        return bookId;
    }

    function getNumBooks() public view returns(uint) {
        return bookCount;
    }

    function getBorrowers() public view stopInEmergency returns (address[16] memory) {
        // address[] memory ret = new address[](bookCount);
        // for (uint i = 0; i < bookCount; i++) {
        //     ret[i] = borrowers[i];
        // }
        // return ret;
        return borrowers;
    }
}