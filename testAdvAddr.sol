pragma solidity ^0.5.3;

/*
* CallTest send ether to Called.
* Deploy the 2 contracts accordingly.
*/

contract Called{
    event logdata(bytes data);

    //这是一个回退函数, 收到以太币会被调用，回退函数没有函数名
    function() public payable {
        /*
        * send()和transfer()有2300gas的限制，因此当合约接收以太币的时候，转账很容易失败
        * 在给合约转账的时候，如果合约的语句多，逻辑复杂，很可能就超过2300gas的限制
        */
        emit logdata(msg.data);
        //if adding one more "emit logdata(msg.data)", the transfer would fail
    }

    function getBalance() public view returns (uint) {
        return this.balance;
    }

}

contract CallTest{

    constructor() public payable {
    }

    function transferEther(address towho) public returns (bool) {
        /*
        * send()错误时不发生异常返回false，使用时一定要检查返回值，大部分时候使用transfer()
        * addr.transfer(y)等价于require(addr.send(y))
        */
        towho.transfer(1 ether);
        return true;
        //or require(towho.send(1 ether))
    }

}
