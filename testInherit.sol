pragma solidity ^0.5.3;

contract base {
    
    uint internal a;
    constructor(uint _a) internal {}
    
    function privateHello() private {
    }

    function internalHello() internal {
    }

    function externalHello() external {
    }

    function publicHello() public {
    }
}

/*
1. 构造函数继承
派生合约需要调用父合约的构造函数，如果有参数，派生合约需要提供参数调用父合约构造函数
contract Derived1 is Base(7) {}
contract Derived2 is Base {
	constructor(uint _y) Base(_y * _y) public {}
}
*/
contract Sub1 is base(5) {
    function hello() public {
        a = 1;
        internalHello();
    }

}

contract Sub2 is base {
    
    constructor(uint s) base(s + 1) public {}
    
    function hello() public {
        a = 1;
        internalHello();
    }

}

/*
2. 多重继承
is后接多个合约，基类合约在is后的顺序很重要
继承顺序原则是从最接近基类到最接近派生类
contract X {}
contract A is X {}
contract C is A, X {} 错误
contract C is X, A {} 正确
A可以覆写X，反过来则不行
*/
contract Subx is base, Sub1 {
    //Sub1可以覆写base
}


/*
3. 抽象合约
合约存在没有函数体（实现）的函数
合约不能通过编译，只能被继承
*/
contract Abstract {
    function test();
    function test1() {
        
    }
}

/*
4. 接口
没有任何函数是已实现的
函数不能继承其他合约，或接口
不能定义构造器、变量、结构体、枚举类
*/
interface TestInterface {
    function test();
    function test2();
}

contract Sub12 is Abstract, TestInterface {
    
}

interface token {
    function transfer();
}

contract ICO {
    token t;
    
    function buy() {
        t.transfer();
    }
}