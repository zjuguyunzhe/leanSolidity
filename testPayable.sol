pragma solidity ^0.5.3;

/*
* payable表示一个函数能附加以太币调用
* 1. 普通函数
* 2. 构造函数
* 3. 回退函数
*/
contract testPayable {

    constructor() public payable {

    }

    function () public payable {

    }

    function deposit() public payable {

    }
}

contract call {

    constructor() public payable {
    }

    function testTransfer(address a) public {
        address myAddress = this;
        if (myAddress.balance >= 1e18) {
           a.transfer(1e18);
        }

    }

}
