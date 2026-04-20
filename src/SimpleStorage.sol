// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint256 private favoriteNumber;

    // Event to log updates
    event NumberUpdated(uint256 newValue);

    // Function to update the stored number
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        emit NumberUpdated(_favoriteNumber);
    }

    // Function to read the stored number
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
}
