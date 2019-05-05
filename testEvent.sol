pragma solidity ^0.5.3;

/*
事件
外部获取只能合约的状态变化
事件其实是以太坊日志接口，可索引

DAPP监听使用
var ev = contracInstance.EventName();
ev.watch(function(err, result) {
	result.args.name;
})
*/
contract testEvent {

    constructor() public payable {
    }

    event Deposit(address _from, uint _value);


    function deposit() public payable {
        emit Deposit(msg.sender, msg.value);
    }
    
    function depositNo() public payable {}
}

contract testEvent2 is testEvent {

    function deposit2() public payable {
        emit Deposit(msg.sender, msg.value);
    }
}
