pragma solidity >=0.6.0 <0.8.0;


contract MappingExemple {
    mapping(address => uint) public balances;

    function update(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }
}

contract MappingUser {
    function f() public returns (uint) {
        MappingExemple m = new MappingExemple();
        m.update(100);
        return m.balances(this);
    }
}