// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Bank{
    address admin;
    string password;
    struct User{
        address id;
        string email;
        string name;
        string phone;
        uint balance;
    }
    
    struct Transaction{
        address id;
        string mode;
        uint amount;
    }
    
    mapping(address=>Transaction[])transactions;
    mapping(address=>User) public users;
    address[] listOfUsers;
    
    modifier isAdmin(){
        require(admin==msg.sender, "Sender is Not Admin");
        _;
    }
    modifier isUser(){
        bool flag =false;
        for(uint x=0;x<listOfUsers.length;x++){
            if(msg.sender==listOfUsers[x]){
                flag=true;
                break;
            }
        }
        if(!flag){
           revert("Your not registred");
        }
        _;
    }
    
    modifier checkPassword(string memory _pwd){
        string memory b = password;
        require(
            keccak256(abi.encodePacked((_pwd))) == keccak256(abi.encodePacked((b))),
            "Password Invalid"
        );
        _;
    }
    
    constructor(){
        admin = msg.sender;
        password = "123";
    }
    
    
    function registration(address _id, string memory _email,  string memory _name ,string memory _phone)public isAdmin {
        listOfUsers.push(_id);
        users[_id]=User(_id,_email,_name,_phone, 0);
    }
    
    function login(string memory _pwd) public view isAdmin returns(bool) {
        string memory b = password;
        if(keccak256(abi.encodePacked((_pwd))) == keccak256(abi.encodePacked((b)))){
            return true;
        }else{
            return false;
        }
    }
    
    function deposit(address _user, uint _balance)public isAdmin {
        transactions[_user].push(Transaction(_user, "Deposit", _balance));
        users[_user].balance += _balance;
    }
     function withdraw(address _user, uint _withdraw)public isAdmin {
        int bal= int(users[_user].balance);
        if(bal - int(_withdraw) <0){
            revert("Insufficient Balance for Withdraw");
        }
        transactions[_user].push(Transaction(_user, "Withdraw", _withdraw));
        users[_user].balance -= _withdraw;
    }
   
    function viewBalance(address _user)public view isAdmin returns(uint){
        return users[_user].balance;
    }
    
    function table(address _user) public view returns(Transaction[] memory){
        return transactions[_user];
    }
    
}