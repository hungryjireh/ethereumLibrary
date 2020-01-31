## Avoiding Common Attacks

1. Ensured that 'require' statements are used.

Eg. For Borrow.sol,

```
function borrowBook(uint bookId) public stopInEmergency returns (uint) {
    require(bookId >= 0 && bookId <= bookCount);
    require(borrowers[bookId] == 0x0000000000000000000000000000000000000000);
    borrowers[bookId] = msg.sender;
    emit LogBorrowed(bookId);
    return bookId;
}
```

I ensure that books borrowed do exist in the library, and that they have not been borrowed before.

2. Unit tests are written to ensure that components in the dapp are functioning.

3. Mnemonic is not stored in plain text and is stored as an environment variable.