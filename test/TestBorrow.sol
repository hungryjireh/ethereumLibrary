pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Borrow.sol";

contract TestBorrow {
    // The address of the borrowing contract to be tested
    Borrow borrow = Borrow(DeployedAddresses.Borrow());
    // Testing the borrowBook() function
    function testUserCanBorrowBook() public {
        uint returnedId = borrow.borrowBook(expectedBookId);

        Assert.equal(returnedId, expectedBookId, "Borrowing of the expected book should match what is returned.");
    }

    // Testing retrieval of a single book's owner
    function testGetBorrowerAddressByBookId() public {
        address borrowAddress = borrow.borrowers(expectedBookId);

        Assert.equal(borrowAddress, expectedBorrower, "Owner of the expected book should be this contract");
    }

    // Testing retrieval of all book owners
    function testGetBorrowerAddressByBookIdInArray() public {
        address[16] memory borrowers = borrow.getBorrowers();
        Assert.equal(borrowers[expectedBookId], expectedBorrower, "Owner of the expected book should be this contract");
    }

    // Testing initialization of address array
    function testInitializeBookArray() public {
        address[16] memory borrowers = borrow.getBorrowers();
        address nullAdd = 0x0000000000000000000000000000000000000000;
        for (uint i = 0; i < borrowers.length; i++) {
            Assert.equal(borrowers[i], nullAdd, "Array should be empty initially.");
        }
    }

    // Testing user borrowing more than 1 arbitrary book
    function testUserBorrowMoreThanOneBook() public {
        address borrowAddress = borrow.borrowers(8);
        address secondBorrowAddress = borrow.borrowers(10);
        Assert.equal(borrowAddress, secondBorrowAddress, "User can borrow more than one book at once.");
    }

    // The id of the book that will be used for testing
    uint expectedBookId = 7;

    //The expected owner of borrowed book is this contract
    address expectedBorrower = address(this);
}