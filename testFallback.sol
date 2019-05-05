pragma solidity ^0.5.3;

/*
回退函数 Fallback
无名称 无参数 无返回值 函数
一个合约可以有一个回退函数
当给合约转以太币时，需要有payable回退函数
如果调用合约时，没有匹配上任何函数，就会调用回退函数

回退函数在接收以太币时执行，仅有2300gas来执行
下面的操作消耗大于2300gas：
1. 写存储（storage）
2. 创建一个合约
3. 执行一个外部（external）函数调用，会花费非常多的gas
4. 发送ether
*/

contract Test {

    uint public x;
    // 由于没有payable ， 向这个合约转账会有异常。
    function() public { x = 1; }
}

contract Caller {

    constructor() public payable {
    }

    function callTest(address test) public {
        test.call(0xabcdef01); // 不存在的hash

        // 无法编译，通过其他方式发送则失败
        // test.send(2 ether);

        test.transfer(1 ether);
    }
}
