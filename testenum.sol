pragma solidity ^0.5.3;
    
    /*
    * 1. 可与整数进行转换，但不能进行隐式转换
    * 2. 枚举类型应至少有一名成员
    */
contract TestEnum {

    // 使用枚举自定义一个类型 ActionChoices
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }

    // 定义一个ActionChoices类型的变量
    ActionChoices choice;

    ActionChoices defaultChoice = ActionChoices.GoStraight;

    function setGoStraight() {
        choice = ActionChoices.GoStraight;
    }

    function getChoice() public view returns (ActionChoices) {
        //运行了setGoStraight之后，此处也返回2
        return choice;
    }

    function getDefaultChoice() public view returns (uint) {
        //只能强制类型转换，此处返回2
        return uint(defaultChoice);
    }
}
