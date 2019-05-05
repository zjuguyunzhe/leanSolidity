
pragma solidity ^0.5.3;

//直接引用github代码
import "github.com/Arachnid/solidity-stringutils/strings.sol";


/*
* 字符串也是数组
* 没有.length属性 bytes(s).length获取字节数组的长度
* bytes(s)[k]:获取字节数组下标k的UTF-8编码
* bytes:用来存储任意长度的字节数据
* string:用来存储UTF-8编码的字符串数据
*
* solidity中的string功能是很弱的，所以需要引入第三方库stringutils
* 字符长度
* 匹配字符串：find(), startsWith(), endsWith()
* 字符串拼接
*/
contract testStr {

    string public str1 = "登链学院";

    // https://www.qqxiuzi.cn/bianma/Unicode-UTF.php
    bytes public bs1 = "登链学院";

    // utf-8 编码长度
    function getLen() public view returns (uint) {
        return bytes(str1).length;
    }

    function getbyte(uint i) public view returns (byte) {
        return bytes(str1)[i];
    }

    using strings for *;   //表示库strings中的函数可以关联到任意的类型上。
    function getStrLen() public view returns (uint len) {
        len = str1.toSlice().len();
    }



    function testStart() public pure returns (bool ) {
        strings.slice memory s = "ABCDE".toSlice();
        return s.startsWith("AB".toSlice());

    }

    // 转为小写。
    function toLower(string str) internal view returns (string) {
		bytes memory bStr = bytes(str);
		bytes memory bLower = new bytes(bStr.length);
		for (uint i = 0; i < bStr.length; i++) {
			// 大写字母
			if ((bStr[i] >= 0x41) && (bStr[i] <= 0x5A)) {
				// 加 0x20 变为小写
				bLower[i] = bytes1(int(bStr[i]) + 32);
			} else {
				bLower[i] = bStr[i];
			}
		}
		return string(bLower);
	}

}
