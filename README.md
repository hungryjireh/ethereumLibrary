# ethereumLibrary

## This dapp was developed as the final project for the ConsenSys Blockchain Bootcamp. 

This project was intended to simulate a library, in which users (represented by different accounts) could borrow books from a virtual, blockchain-based library.

To run this project,
1. Clone this repository
2. Change directory into the repository, run "npm install" to install all required packages.
3. Run "npm run dev" to see the frontend of the web application.

Notes
* Note that the project runs on Ganache GUI (port 7545)
* Ensure that you configure your environment file (.env) with the following variables:
1. MNEMONIC (12-word wallet secret key)
2. PROJECT_URL (obtained from Infura)
* The library implementation can be found in contracts/LibraryDemo.sol (OpenZeppelin's SafeMath)