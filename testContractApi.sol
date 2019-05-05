pragma solidity ^0.5.3;

/*
* 函数修改器
* modifier关键字定义函数修改器
* 函数修改器可以用来改变一个函数的行为。
* 通常用于在函数执行时检查某种前置条件。
* 函数修改器修饰函数时，函数体被插入到"_;"
*
* 函数修改器可被继承使用
* 函数修改器可接受参数
* 多个函数修改器一起使用（空格隔开，修改器会依次检查执行）
*/

contract owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

/*
* this:表示当前合约，可以转会为一个地址
* selfdestruct(address recipient)
* suicide(address recipient)
* 销毁合约，并把它所有资金发送到给定的地址
*/

contract testContract is owned {

    function hello() public view returns (string) {
        return "hello";
    }
    
    modifier over18(uint age) {
        require(age >= 18);
        _;
    }
    
    function kill(uint age) public onlyOwner over18(age) {
      selfdestruct(owner);  // 销毁合约
    }

    function innocence() public {
        this.hello();
        selfdestruct(owner);  // 销毁合约
    }
}

contract testCall {

    function hello() public view returns (string) {
        return "hello";
    }

    function call(address a) {
        a.delegatecall(bytes4(sha3("innocence()")));
    }
}
