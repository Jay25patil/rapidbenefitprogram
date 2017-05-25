pragma solidity ^0.4.4;

//import "./ConvertLib.sol";

contract SmartCurrency  {
mapping (address => uint256) shares;
mapping (address => uint256) balances;
mapping (address => uint256) leaves;
    
event Transfer(address indexed _from, address indexed _to, uint256 _value);

function SmartCurrency(){
        balances[tx.origin]=1000;
        leaves[tx.origin]=10;
        shares[tx.origin]=10;        
}
function SendCoins(address receiver,uint amount)returns(bool sufficient){
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Transfer(msg.sender, receiver, amount);
        return true;
}

    /*function Balance(address addr) returns(uint){
        return ConvertLib.convert(Balance(addr),2);
    }*/

function getBalance(address addr) returns(uint) {
        return balances[addr];
}
     
function SendShares(address receiver,uint amount)returns(bool sufficient){
        if (shares[msg.sender] < amount) return false;
        shares[msg.sender] -= amount;
        shares[receiver] += amount;
        Transfer(msg.sender, receiver, amount);
        return true;
}

/*function Shares(address addr)returns(uint) {
        return ConvertLib.convert(Shares(addr),2);
}*/

function checkshares(address addr) returns(uint) {
        return shares[addr];
}

function GrantLeaves(address receiver,uint amount)returns(bool sufficient){
         if(leaves[msg.sender] < amount) return false;
         leaves[msg.sender] -= amount;
         leaves[receiver] += amount;
         Transfer(msg.sender, receiver, amount);
         return true;
        
}

/*function Leavs(address addr )returns (uint) {
        return ConvertLib.convert(Leavs(addr),2);
}*/

function checkleaves(address addr) returns(uint) {        
        return leaves[addr];
}

}