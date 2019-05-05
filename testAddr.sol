pragma solidity ^0.5.3;

contract TestAddr {

    constructor() public payable {
        //The constructor should be payable if you send value
    }

    // 获取一个账号的余额，注意把地址替换为自己的账号地址
    function testBlance() public pure returns (uint) {
        address a = 0xb695ce0ef0059ac737160608fc15903117947bd6;
        return a.balance;  // wei   1eth = 10e18wei
    }

    // 参看合约地址余额，在创建账号的时候附加一个以太币
    function testSelfBlance() public view returns (uint) {
        address a = this;
        return a.balance;
    }


    // 地址如何作为参数：注意加上引号，有时候不加引号也可以，看编译器版本
    function balance(address a) public pure returns (uint) {
        return a.balance;
    }
    
    /*
    * 从当前合约转出以太币到指定账户
    */
    function testTransfer(address a) public {
        //获取当前合约地址
        address myAddress = this;

        //转移1 eth  （1eth  = 10^18wei）
        if (myAddress.balance >= 1e18) {
           //思考谁来支付矿工费呢？
           //矿工费由发起交易账户来支付
           a.transfer(1e18);
        }

    }
}
