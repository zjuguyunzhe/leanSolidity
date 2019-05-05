pragma solidity ^0.4.18;

/*
* "internal" is the same as private, except that it's 
* ALSO accessible to contracts that inherit from this contract.
* 
* "external" is similar to public, except that these functions can 
* ONLY be called outside the contract — they can't be called by other functions inside that contract.
*/

/*
* 像其他类型一样，函数类型可以作为变量类型，也可以作为返回值类型（函数式语言的特点）
* 两种函数类型：
* 外部（external）函数：发起EVM消息调用，使用"地址.函数名"进行调用
* 内部（internal）函数：代码跳转调用，gas小得多，但无法在合约外部调用，使用"函数名"进行调用
* 若不指明，则默认是内部函数
*
* 声明一个函数：
* function foo(int);
* function foo(int) external returns (int);
*
* 声明一个函数类型的变量：
* function (int) foo;
* function (int) external returns (int) foo;
* 
* 成员.selector属性，返回函数选择器，即函数签名，内部函数没有.selector属性
*/
contract TestFunc {

  function a(uint x) internal returns (uint z) {
    return x * x;
  }

  function b(uint x) internal returns (uint z) {
    return 2 * x;
  }

  //  变量f 可以被赋值为函数a 或 函数b
  function select(function (uint) external returns (uint) f, uint x) external returns (uint z) {
     return f(x);
  }

  // 函数作为返回值的类型
  function getfun() public view returns (function (uint) external returns (uint) ) {
      return this.b;
  }


  function callTest(bool useB, uint x) external returns (uint z) {
    // 变量f 可以被赋值为 函数a 或 函数b
    function (uint) returns (uint) f;
    if (useB) {
        f  = this.b;
    } else {
        f = this.a;
    }
    return f(x);
  }


    // 0x26121ff0
    function f() public view returns (bytes4) {
        return this.f.selector;
    }
}
