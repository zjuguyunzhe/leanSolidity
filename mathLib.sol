pragma solidity ^0.5.3;

/*
可以像合约一样进行部署，但是没有状态变量，不能存以太币
可重用
部署一次，在不同的合约内反复使用
节约gas，相同功能的代码不用部署一遍又一遍

库函数使用委托的方式调用DELEGATECALL，库代码是在发起合约中执行的

using for扩展类型
using A for B 把库函数（从库A）关联到类型B
A库由函数add(B b)，则可使用b.add()
*/
library mathlib {

      function plus(uint a, uint b) public view returns (uint) {
            uint c = a + b;
            assert(c>=a && c>=b);
            return c;
      }

      function getThis() public view returns (address) {
          return this;
      }

}
