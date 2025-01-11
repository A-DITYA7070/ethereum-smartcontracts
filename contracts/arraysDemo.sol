// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract arrayDemo{

    uint[] nums;
    uint[5] fixed_nums;

    function getValues() public view returns(uint[] memory){
        return nums;
    }

    function getFixedValues() public view returns(uint[5] memory){
        return fixed_nums;
    }

    function setVales(uint num) public{
        nums.push(num);
    }

    function setFixedValues(uint num,uint _i) public {
        fixed_nums[_i]=num;
    }

    function removeValues() public{
        nums.pop();
    }

    function removeFixedValues(uint _i) public{
        delete(fixed_nums[_i]);
    }



}