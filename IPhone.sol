// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

/// @title IPhone ownership smart contract
/// @author Idris Elgarrab
/// @notice This smart contract manages the ownership of an IPhone.
/// @dev The contract allows the owner to set the sale status (open or closed) and users to buy the IPhone by sending the required payment.

contract IPhone {

    uint balance;
    address owner;
    address origin;
    enum State { Opened, Closed }
    State sc = State.Closed;

    /// @notice Initializes the contract with the initial balance and sets the owner and origin addresses.
    constructor() payable {
        balance = msg.value;
        origin = tx.origin;
        owner = msg.sender;
    }

    /// @dev Modifier to check if the given amount is greater than or equal to 1 wei.
    modifier checkAmount(uint _amount) {
        require(_amount >= 1 wei, 'Not enough money, Currency must be greater than 1 ether');
        _;
    }

    /// @dev Modifier to check if the caller is the owner of the contract.
    modifier onlyOwner {
        require( msg.sender == owner, "Sorry! You're not the owner..");
        _;
    }

    /// @dev Modifier to check if the sale status is open.
    modifier onlyOpen {
        require(sc == State.Opened , "Sorry! The item is not available..");
        _;
    }

    /// @notice Opens the sale of the IPhone.
    function openSell() public onlyOwner {
        sc = State.Opened ;
    }

    /// @notice Closes the sale of the IPhone.
    function closeSell() public onlyOwner {
        sc = State.Closed ;
    }

    /// @notice Allows a user to buy the IPhone by sending the required payment.
    /// @param _amount The amount of payment in wei.
    function pay(uint _amount) public payable checkAmount(_amount) onlyOpen{
        balance += _amount;
        owner = msg.sender;
        sc = State.Closed;
    }

    /// @notice Returns the balance, origin, and current owner of the IPhone.
    /// @return _balance The balance of the contract.
    /// @return _origin The origin address.
    /// @return _currentOwner The current owner address.
    function get() public view returns (uint _balance, address _origin, address _currentOwner) {
        return (balance, origin, owner);
    }

    /// @notice Returns the current sale status of the IPhone.
    /// @return The sale status as a string ("Open" or "Oops! Closed").
    function status() public view returns(string memory) {
        string memory answer;
        sc == State.Opened ?  answer = "Open" : answer = "Oops! Closed";
        return answer;
    }
}

