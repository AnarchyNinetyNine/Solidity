# IPhone Ownership Smart Contract

This is a simple smart contract written in Solidity to manage the ownership of an IPhone. The contract allows the owner to set the sale status (open or closed) and users to buy the IPhone by sending the required payment.

* Features

**1. Set the sale status of the IPhone `(open or closed)` by the owner.
**2. Users can buy the IPhone by sending the required payment.
**3. View the current sale status, balance, origin, and owner of the IPhone.


* Usage

1. Deploy the smart contract with an initial balance.
2. The owner can open or close the sale of the IPhone using the openSell() and closeSell() functions.
3. Users can buy the IPhone by calling the pay() function with the required payment in wei.
4. The get() function returns the balance, origin, and current owner of the IPhone.
5. The status() function returns the current sale status of the IPhone as a string ("Open" or "Oops! Closed").
