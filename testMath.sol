pragma solidity ^0.5.3;

/*
* 哈希函数（散列函数）：任意长度的输入，通过散列算法，变换成固定长度的输出
* MD4, MD5, ripemd-160, SHA(Secure Hask Algorithm)密码散列函数家族
* SHA家族：
* SHA-1
* SHA-2:SHA-224,SHA-256,SHA-384,SHA-512
* SHA3:Keccak算法
* 
* keccak256(...) returns (bytes32)
* sha3(...) returns (bytes32)
* sha256(...) returns (bytes32)
* ripemd160(...) returns (bytes32)
*/
contract testMath {

      function testAddmod() public view returns (uint) {
          uint x = 2**256 - 1;
          uint y = 1;
          uint k = 100;

          return addmod(x , y, k);
          // return (x + y) % 100; //会溢出

          // return mulmod(2**256 - 1 , 2**256 - 1, 100);
      }

    function testsha3() public view returns (bytes32) {
        return keccak256("set(uint256)");
    }

}
