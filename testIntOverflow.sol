pragma solidity ^0.5.3;

contract TestFlow {
    uint256 public zero = 0;
    uint256 public max = 2**256 - 1;
    uint256 public mm = 2**255;

    function subUnderFlow() public view returns (uint) {
        uint256 a =  zero - 1;
        return a;
    }

    function addOverFlow() public view returns (uint) {
        uint256 a =  max + 1;
        return a;
    }

    function mulOverFlow() public view returns (uint) {
        uint256 a =  mm * 2;
        return a;
    }

    uint8 c;

    function add(uint8 a, uint8 b) public returns (uint8) {
        c = a + b;
        //Method to solve the overflow: using assert
        assert(c >= a);
        return c;
    }
}
