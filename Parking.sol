// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Parking {
    address public owner;
    uint256 public parkingFee = 1 ether;
    mapping(address => uint256) public parkedUntil;

    constructor() {
        owner = msg.sender;
    }

    function park() external payable {
        // Require that the user pays the correct parking fee
        require(msg.value == parkingFee, "Parking fee is required!");

        // Checks if the user is parked today
        require(parkedUntil[msg.sender] < block.timestamp, "You are already parked for today!");

        parkedUntil[msg.sender] = block.timestamp + 1 days;

        emit Parked(msg.sender, parkedUntil[msg.sender]);
    }

    function isParked(address user) external view returns (bool) {
        // Assert that the parking time data is consistent
        assert(parkedUntil[user] >= block.timestamp);
        return parkedUntil[user] > block.timestamp;
    }

    function removeCar() external {
        // Revert if the user hasn't parked yet or parking time expired
        if (parkedUntil[msg.sender] < block.timestamp) {
            revert("Parking time is over or you haven't parked yet!");
        }

        parkedUntil[msg.sender] = 0;

        emit CarRemoved(msg.sender);
    }

    event Parked(address indexed user, uint256 parkedUntil);
    event CarRemoved(address indexed user);
}
