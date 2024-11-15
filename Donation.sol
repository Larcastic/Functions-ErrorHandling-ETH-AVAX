// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Donation {
    address public owner;
    uint public minimumDonation;

    event DonationReceived(address indexed donor, uint amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    constructor(uint _minimumDonation) {
        owner = msg.sender;
        minimumDonation = _minimumDonation;

        assert(owner != address(0));
    }

    function setMinimumDonation(uint _minimumDonation) public onlyOwner {
        if (_minimumDonation == 0) {
            revert("Minimum donation cannot be zero.");
        }
        minimumDonation = _minimumDonation;
    }

    function donate() public payable {
        require(msg.value >= minimumDonation, "Donation amount is too low.");
        emit DonationReceived(msg.sender, msg.value);
    }
}
