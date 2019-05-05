pragma solidity ^0.5.3;

import "./iterable_mapping.sol";

contract TestMapping {

    //  生成对应函数
    mapping(address => uint) public balances;

    function update(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }
    
    /*
    * 映射局限性
    * 1. 只能作为状态变量
    * 2. 无法遍历访问
    * 没有长度
    * 没有键集合
    * 没有值集合
    */
    function test() {
       mapping(address => uint) a;
    }

    IterableMapping.itmap data;

    function insert(uint k, uint v) public returns (uint size) {
        IterableMapping.insert(data, k, v);
        return data.size;
    }

    function sum() public returns (uint s) {
        for (uint i = IterableMapping.iterate_start(data); IterableMapping.iterate_valid(data, i); i = IterableMapping.iterate_next(data, i))
        {
            uint key;
            uint value;
            (key, value) = IterableMapping.iterate_get(data, i);
            s += value;
        }
    }
}
