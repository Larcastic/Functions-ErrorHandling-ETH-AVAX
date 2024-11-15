# My entry for the Functions and Errors Module - ETH+AVAX Project in Metacrafters
A simple, donation smart contract.

# Description
In this assessment we were tasked to show how Error Handling works or have require(), assert() and revert() statements on our smart contract.

# Code Details
For this project, we made a smart contract that will handle donations using Ether via Solidity.

- For the first require() statement, it is housed inside on the onlyOwner modifier and the smart contract restricts that only the owner can do the donations and use the smart contract.
    ```
    require(msg.sender == owner, "Only the owner can perform this action.");
    ```
- For the second require() statement, it is encased via the donate() function and the smart contract demands that the minimumDonation should not be lower that the msg.value.
    ```
    require(msg.value >= minimumDonation, "Donation amount is too low.");
    ```
  - For the revert() statement, it requires the owner to have a donation that will not equal to zero.
     ```
     revert("Minimum donation cannot be zero.");
    ```
- Lastly, we made an assert() statement to assure that the owner's address will not equal to zero.
    ```
    assert(owner != address(0));
    ```
# Author
Lars James Manansala (larsjamesmanansala@gmail.com)
