# BANK_MANAGEMENT-USING-SOLIDITY
It is a simple project for bank staff side web application where staffs can login to the portal , create new account for customer , withdraw and deposit if the customer request them  , then they can see the transaction history of any accout , finally they can logout.
This project will require these steps to run  => install ganache => create workspace => open https://remix.ethereum.org/ => import bank.sol file under contacts folder              => then deploy the contract with web3 provider in **Environment** => a dialogue box will appear => change http://127.0.0.1:8545 to http://127.0.0.1:7545                            => by deploying you can access all the functions
open ligin.html in the extracted folder , by default your  _user id_  will be the address which you used while deploying contract , and password is _123_ , you change this password in the constructor of bank.sol file .
after loged in you can add a new account of a customer
you can search any account by their address , only if you created account with that address
then you can see all the account holders details
there you can deposit , withdraw and see transaction details of the account .


Screen shot of the project

login page 
![image](https://user-images.githubusercontent.com/71652056/121128197-a4062a00-c848-11eb-9a0d-1c855c926722.png)


add account
![image](https://user-images.githubusercontent.com/71652056/121128868-b5036b00-c849-11eb-8b28-6428fb0ce24c.png)



search for account
![image](https://user-images.githubusercontent.com/71652056/121127990-470a7400-c848-11eb-9bb3-b6c7dc976dec.png)


account details
![image](https://user-images.githubusercontent.com/71652056/121128098-73be8b80-c848-11eb-8ce4-46a307b44691.png)


transaction details
![image](https://user-images.githubusercontent.com/71652056/121128142-8a64e280-c848-11eb-948f-966550d4b3be.png)



