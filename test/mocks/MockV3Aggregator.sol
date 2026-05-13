// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

contract MockV3Aggregator {
    uint8 public decimals;
    int256 public latestAnswer;
    uint256 public version = 4;

    constructor(uint8 _decimals, int256 _initialAnswer) {
        decimals = _decimals;
        latestAnswer = _initialAnswer;
    }

    function latestRoundData()
        external
        view
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80
        )
    {
        return (0, latestAnswer, 0, 0, 0);
    }

    function updateAnswer(int256 _answer) external {
        latestAnswer = _answer;
    }
}