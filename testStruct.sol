pragma solidity ^0.5.3;

// 引入试验版本
pragma experimental ABIEncoderV2;

contract testStruct {

    struct CustomType {
        bool myBool;
        uint myInt;
        // CustomType aa;
    }

    struct CustomType2 {
        CustomType[] cts;
        mapping(string=>CustomType2) indexs;
    }

    struct CustomType3 {
        string name;
        mapping(string=>uint) score;
        int age;
    }

    // 仅声明变量，不初始化
    CustomType ct1;

    // 按成员顺序（结构体声明时的顺序）初始化
    CustomType ct2 = CustomType(true, 2);
    CustomType3 ct3 = CustomType3("Tiny", 18);   // 跳过对mapping的初始化

    function init() {
        CustomType memory ct3 = CustomType(true, 2);   // 在函数内声明
    }

    // 命名方式的初始
    CustomType ct = CustomType({ myBool: true, myInt: 2});

    function getSet() public returns (bool) {
        ct.myBool = false;
        return ct.myBool;
    }

    /*
    * 结构体目前仅支持在合约内部使用，或继承合约内使用，
    * 如果要在参数和返回值中使用结构体，函数必须声明Internal
    */
    // 合法
    function interFunc(CustomType ct) internal {
    }

    // 非法
    function exterFunc(CustomType ct) public {

    }


}
