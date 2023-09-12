# Solidity Assessment

This Solidity smart contract serves as a basic example of a token contract with simple minting and burning functionalities. It includes public variables to store token details, a constructor to initialize these details, and a struct for token information.

## Token Details

- *Token Name*: MiCoin
- *Token Abbreviation*: MCN
- *Total Supply*: 0

## Contract Structure

```
pragma solidity ^0.8.18;

contract MyToken {

    // Public variables for token details
    string public tokenName;
    string public tokenAbbvr;
    uint public totalSupply;

    struct TokenDetails {
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
```

## Usage 

You can deploy and interact with this contract using Remix, an online Solidity IDE. Follow these steps:

1. Go to [Remix](https://remix.ethereum.org/).
2. Create a new Solidity file (e.g., MyToken.sol) and paste the contract code.
3. Compile the contract by selecting the appropriate compiler version.
4. Deploy the contract, which will initialize it with the provided token details.
5. Use the mint function to create tokens and increase the total supply.
6. Use the burn function to destroy tokens and decrease the total supply.

This contract can serve as a starting point for those learning Solidity and wanting to explore token creation and management on the Ethereum blockchain. Feel free to modify and build upon it for more complex projects.
