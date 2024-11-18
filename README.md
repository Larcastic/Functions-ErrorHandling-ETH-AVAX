# My entry for the Functions and Errors Module - ETH+AVAX Project in Metacrafters
A simple and unique smart contract that acts as a parking toll.

# Description
In this assessment we were tasked to show how Error Handling works or have require(), assert() and revert() statements on our smart contract and will incorporate real-world scenarios.

# Code Details
For this project, we made a smart contract that will handle parking fees using Ether via Solidity.

- For the first require() statement, it is housed inside on the park() function and the smart contract the user to pay a parking fee of 1 ETH.
    ```
     require(msg.value == parkingFee, "Parking fee is required!");
    ```
- For the second require() statement, it is also housed inside the park() function and the smart contract checks if the user was parked today.
    ```
    require(parkedUntil[msg.sender] < block.timestamp, "You are already parked for today!");
    ```
  - For the assert() statement, it checks if the parking time data is consistent.
     ```
    assert(parkedUntil[user] >= block.timestamp);
    ```
- Lastly, we made an revert() statement that reverts the smart contract at its previous state if the user hasn't parked yet or the parking time is over..
    ```
     if (parkedUntil[msg.sender] < block.timestamp) {
            revert("Parking time is over or you haven't parked yet!");
        }
    ```
# Author
Lars James Manansala (larsjamesmanansala@gmail.com)
