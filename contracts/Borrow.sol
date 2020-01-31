pragma solidity ^0.5.0;

/// @title A smart contract to simulate borrowing books from the library.
/// @author Jireh (based Pet Shop Tutorial)

contract Borrow {
    bool private emergency = false;
    address private admin;

    uint public bookCount;
    address[16] public borrowers;

    event LogBorrowed(uint bookId);

    modifier onlyAdmin {
        /// @dev allows marked functions to only be triggered by an admin
        require(msg.sender == admin);
        _;
    }

    modifier stopInEmergency {
        /// @dev allows marked functions to be shutdown in an emergency
        require(!emergency);
        _;
    }

    modifier onlyInEmergency {
        /// @dev allows marked functions to be run in an emergency
        require(emergency);
        _;
    }

    constructor() public {
        /// @dev initialize bookCount as 15 (0th index)
        bookCount = 16;
    }

    /** @title toggle emergency. */
    function toggleEmergency() public onlyAdmin returns (bool) {
        /// @dev function that allows the owner of the contract to trigger a contract shutdown
        /// @return circuit breaker design pattern, disables other functions
        emergency = !emergency;
        return true;
    }

    /** @title borrow book. */
    function borrowBook(uint bookId) public stopInEmergency returns (uint) {
        /// @dev function that allows users to borrow books.
        /// @param bookId book being borrowed
        /// @return return int ID of book that has been borrowed
        require(bookId >= 0 && bookId <= bookCount);
        require(borrowers[bookId] == address(0));
        borrowers[bookId] = msg.sender;
        emit LogBorrowed(bookId);
        return bookId;
    }

    /** @title get number of books. */
    function getNumBooks() public view stopInEmergency returns(uint) {
        /// @dev function that returns the total number of books (16 in this case)
        /// @return return int number of books
        return bookCount;
    }

    /** @title get borrowers. */
    function getBorrowers() public view stopInEmergency returns (address[16] memory) {
        /// @dev function that returns the address array of all borrowers
        /// @return get address[16] array of all borrowers
        return borrowers;
    }
}