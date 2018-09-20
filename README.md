# Quiniela's Smart Contract

[![Woonkly](https://woonkly.com/img/email-assets/powered-by.png)](https://woonkly.com)

This Smart Contract was designed to establish the functionality of our project "Youtuber's _Quiniela_".

## Technologies you will need.
* **[Node.js](https://nodejs.org/en/)** - Cross-platform, open source runtime environment for the server layer.
* **[Ganache](https://truffleframework.com/docs/ganache/overview)** - Ganache is a personal blockchain for Ethereum development you can use to deploy contracts, develop your applications, and run tests.
* **[Truffle](https://truffleframework.com/docs/truffle/overview)** - A world class development environment, testing framework and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM), aiming to make life as a developer easier.


## Starting the project.
To start the project, just run this command:
```bash 
truffle compile
```
## What does our Smart Contract do?
Our Smart Contract has different functions:
* addUser
* test
* setWinners
* vote
* payMoney
* playersLenght
* kill

## What can you do with our functions?
You can do all the basic operations in order to make the Quiniela work, in this section we will explain every function.
* **addUser**: Adds a user to the Quiniela, it receives the user's decision, the username and the user's password.
* **test**: Validates if the password matches the contract's password.
* **setWinners**: Establishes the Quiniela's winner(s).
* **vote**: Registers a vote in favour of a YouTuber.
* **payMoney**: Divides the prize between all the winners and pays them by sending the money to their wallets.
* **playersLenght**: Returns the username's lenght.
* **kill**: Erase a YouTuber from the Quiniela.

## Testing the contract.
In order to test the contract, you need to run the following command:
```bash 
truffle test
```