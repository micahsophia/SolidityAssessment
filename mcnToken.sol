// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // Public variables for token details
    string public tokenName;
    string public tokenAbbvr;
    uint public totalSupply;

    struct TokenDetails{
        string name;
        string abbvr;
        uint supply;
    }

    // Mapping to store balances of addresses
    mapping(address => uint256) public balances;

    // Constructor to initialize token details
    constructor() {
        TokenDetails memory details = TokenDetails({
            name: "MiCoin",
            abbvr: "MCN",
            supply: 0
        });
        tokenName = details.name;
        tokenAbbvr = details.abbvr;
        totalSupply = details.supply;
    }

    // Function to mint tokens and increase total supply
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Function to burn tokens and decrease total supply
    function burn(address _address, uint _value) public {
        if (balances[_address] >= _value) {
            totalSupply -= _value;
            balances[_address] -= _value;
        }
    }
}