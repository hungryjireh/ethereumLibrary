pragma solidity ^0.5.0;

import '@openzeppelin/contracts/math/SafeMath.sol';

contract LibraryDemo {
    using SafeMath for uint256;

    //exception when overflow
    function safeAddition() public pure returns (uint256) {
        uint256 a = 2**256 - 1;
        return a.add(1);
    }

    //exception when underflow
    function safeSubtract() public pure returns (uint256) {
        uint256 a = 0;
        return a.sub(1);
    }

    function safeMultiplication() public pure returns (uint256) {
        uint256 a = 2**256 - 1;
        return a.mul(a);
    }

    function safeDivision() public pure returns (uint256) {
        uint256 a = 1;
        return a.div(0);
    }
}