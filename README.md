# My entry for the Functions and Errors Module - ETH+AVAX Project in Metacrafters
A modification of Quanta in order for us to highlight how Functions and Error Handling works in Solidity.

# Description
In this assessment we were tasked to show how Error Handling works or have require(), assert() and revert() statements on our smart contract.

# Code Details
*for the purpose of ease, the code was set to public.*
- We recycled our code for the Intro ETH Assesment that creates, mints and burns our own Token in Solidity.

- For the require() statement, we placed it on the minting function of the smart contract in order for us to catch if ever the user were to implement a _value less than 10.

    // mint function
    function mint (address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
        
        require(_value > 10, "Input must be greater than 10");
    }

  - For the revert() statement, we made our own function which will then revert the code to its previous state if ever the user were to input a _value less than or equal to 10.
 
       function testRevert(uint _value) public pure {
        if (_value <= 10) {
            revert("Input must be greater than 10");
        }
    }

- Lastly, we made an assert() statement to assure that our smart contract's total supply will have its totalSupply at 0 initially, since assert() will proceed to run if its condition is met.

   function testAssert() public view {
        assert(totalSupply == 0);
    }

# Author
Lars James Manansala (larsjamesmanansala@gmail.com)
