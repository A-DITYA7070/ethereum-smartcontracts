
pragma solidity >=0.8.2 <0.9.0;


// SPDX-License-Identifier: MIT

contract Addition {
    uint private x; // Variable to store the sum
    string private text = "The sum of two numbers is ";

    // Function to set the sum of two numbers
    function set(uint data1, uint data2) public {
        x = data1 + data2;
    }

    // Function to get the result as a string
    function get() public view returns (string memory) {
        return string(abi.encodePacked(text, uint2str(x)));
    }

    // Helper function to convert uint to string
    function uint2str(uint _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}
