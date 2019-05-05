pragma solidity ^0.5.3;

contract called {
    
    //tx.origin(address):交易的最初发起者
    function testCalled() public returns (address addr)  {
        return msg.sender;   // tx.origin;
    }
}

contract testBlockApi {

    function getValue() public payable returns (address , uint) {
        return (msg.sender, msg.value);
    }

    function diffGas() public returns (uint, uint) {
        uint g1 = gasleft();
        uint a = 1 + 2;
        uint g2 = gasleft();

        return (g1 - g2, g2);
    }

    function testCall() public returns (address)  {
        return new called().testCalled();
    }
    
    //msg.sig(byte4):调用数据(calldata)的前4个字节(例如：函数标识符)
    function testf() public returns (bytes4)  {
        return this.testf.selector;
        // return msg.sig;  //  0xf39581ad
    }

}
