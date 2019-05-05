pragma solidity ^0.5.3;

/*
view
表示一个函数不能修改状态
本地执行不消耗gas
下面几种情况认为是修改了状态：
1. 写状态变量
2. 触发事件
3. 创建其他的合约
4. call调用附加了以太币
5. 调用了任何没有view或pure修改的函数
6. 使用了低级别的调用（low-level calls)

pure
表示一个函数不读取状态，也不修改状态
本地执行不消耗gas
下面几种情况认为是读取了状态：
1. 读状态变量
2. 访问了.balance属性
3. 访问了block,tx,msg成员（msg.sig和msg.data除外）
4. 调用了任何没有pure修饰的函数
*/
contract testView {
    uint public b;


    function f(uint a) public returns (uint) {
        b = a * 2;
        return b;
    }
    
    function f1(uint a) public view returns (uint) {
        b = a * 2;
        return b;
    }
    
    function p(uint a) public view returns (uint) {
        return a * 2;
    }

}
