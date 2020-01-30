## Design Pattern Decisions

1. An array of 16 was created to simulate 16 books in a library. In reality, the number of books in a library is arbitrary and should be represented by a flexible-sized array (mapping).
2. Books should not be borrowed twice, and hence in Borrow.sol, I check that the book has not been previously assigned to anyone before assigning the book.
3. For tests, I wanted to demonstrate that it is possible for a user to borrow multiple books at once.
4. A circuit breaker design pattern was used, but only the "stop in emergency" was utilised and not the "only in emergency" method. This is because the smart contract does not hold any funds, and hence an "only in emergency" method (eg. withdrawal) would be redundant. Nonetheless, the "only in emergency" method was still included in the smart contract for future developments.
5. No other design patterns were utilised due to the small scope of the particular smart contract written.