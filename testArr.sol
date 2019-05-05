pragma solidity ^0.5.3;

contract testArr {

    uint [10] tens;
    uint [] us;
    
    /*
    * 如果是public的状态变量，会生成一个公有的状态函数，函数名和变量名一样
    */
    uint [] public u = [1, 2, 3];   // public -> 生成函数
    uint [] public b = new uint[](7);  // storage


    function get() public view returns (uint) {
        tens[0] = 1;
        return tens[0];
    }
    
    //长度为5的可变长数组
    uint[][5] public a;
    function setA() public  {
        a[1] =  [1,2];
        a[2] =  [1,2,3];
       //  a[6] =  [1,2,3];
    }
    
    
    /*
    * .length 获取长度
    * storage的变长数组，可以通过给.length赋值调整数组长度
    * memory数组一旦创建，大小不可调整
    * 定长数组大小也不可调整
    *
    * .push()添加元素，返回新长度
    * 仅针对变长数组
    * memory数组不支持
    * 定长数组也不支持
    */
    function getLen() public view returns (uint) {
        return tens.length;
    }

    function modifyLenAndPush() public returns (uint) {
       b.length = 10;      //可以修改storage的数组

       b[7] = 100;
       b.push(20);
       // tens.push(10);


       uint[] memory a = new uint[](7);
    //   a.push(10);
    //   a.length = 10;

       return b.length;
   }


}
