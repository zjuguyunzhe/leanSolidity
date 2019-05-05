pragma solidity ^0.5.3;

/*
* addr.call(函数签名, 参数) -> 调用指定合约函数
* .valus()附加以太币
* .gas()指定gas
* addr.call.value(y)()功能上类似于addr.transfer(y) 
* call()没有gas限制
* 
* delegatecall(函数签名, 参数) -> 使用当前合约上下文
* 不支持.valus()
*/
contract Called {
    uint public n;
    address public sender;
    
    //payable表示该函数可以接收以太币
    function setN(uint _n) payable {
        n = _n;
        //交易发起者的账户地址，即CallTest合约地址
        sender = msg.sender;
    }

    event logdata(bytes data);

    function () public payable {
        emit logdata(msg.data);
    }

    function getBalance() public view returns (uint) {
        return this.balance;
    }
}

contract CallTest {
    uint public n;
    address public sender;

    //只是调用代码，合约环境还是当前合约，改变的是CallTest合约的状态变量
    function delegatecallSetN(address _e, uint _n) {
        bytes4 methodId = bytes4(keccak256("setN(uint256)"));
        require(_e.delegatecall(methodId, _n));
    }

    function callSetN(address _e, uint _n) {
        //取前4个字节，获取函数签名
        bytes4 methodId = bytes4(keccak256("setN(uint256)"));
        require(_e.call(methodId, _n));
        // require(_e.call.gas(1000)(methodId, _n));
        // require(_e.call.gas(1000).value(1 ether)(methodId, _n));
    }

    function callNoFunc(address addr) returns (bool){
        return addr.call("tinyxiong", 1234);
    }
}
