// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Users
{
    // properties
    uint256 id = 0;
    string name = "Amir";
    mapping(uint => string) public MyRoles;
    struct Contact
    {
        uint256 ContactId;
        string mobile;
    }
    Contact[] MyContact;

    // constructor
    constructor (uint256 i, string memory n)
    {
        id = i;
        name = n;
    }
    
    function GetName() public view returns (string memory)
    {
        return name;
    }
    
    function SetName (string memory n) public
    {
        name = n;
    }
    
    // working with struct
    function GetContact(uint256 i) public view returns (Contact memory)
    {
        return MyContact[i];
    }
    function SetContact(uint256 i, string memory m) public
    {
        Contact memory temp;
        temp.ContactId = i;
        temp.mobile = m;
        MyContact.push(temp);
        //MyContact.push({"ContactId":i, "mobile":m});
    }
    
    // working with mapping
    function SetRole (uint256 i, string memory r) public
    {
        MyRoles[i] = r;
    }
}
