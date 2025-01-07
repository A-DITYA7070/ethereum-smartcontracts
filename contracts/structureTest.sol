// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract Test{
    struct Student{
        string name;
        uint8 roll_no;
        string[] courses;
    }

    Student first;

    function setData(string memory _name,uint8 _roll,string[] memory _courses) public {
        first.name=_name;
        first.roll_no=_roll;
        first.courses = _courses;
    }

    function getStudentData() public view returns(string memory,uint8,string[] memory){
        return (first.name,first.roll_no,first.courses);
    }
}