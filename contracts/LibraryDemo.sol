pragma solidity ^0.5.0;

import '@openzeppelin/contracts/math/SafeMath.sol';

contract LibraryDemo {
    using SafeMath for uint256;

    /** @title safe addition. */
    function safeAddition() public pure returns (uint256) {
        /// @dev function throws exception when overflow
        /// @return uint256 value of addition
        uint256 a = 2**256 - 1;
        return a.add(1);
    }

    /** @title safe subtraction. */
    function safeSubtract() public pure returns (uint256) {
        /// @dev function throws exception when underflow
        /// @return uint256 value of subtraction
        uint256 a = 0;
        return a.sub(1);
    }

    /** @title safe multiplication. */
    function safeMultiplication() public pure returns (uint256) {
        /// @return uint256 value of multiplication
        uint256 a = 2**256 - 1;
        return a.mul(a);
    }

    /** @title safe division. */
    function safeDivision() public pure returns (uint256) {
        /// @return uint256 value of division
        uint256 a = 1;
        return a.div(0);
    }
}