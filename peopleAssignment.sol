pragma solidity 0.5.12;

contract peopleAssignment {
    
    struct Person {
        string name;
        uint age;        
        uint height;
        address origCreator;
        bool eighteenOrMore;
    }
    
    Person[] private peopleArray;
    
    mapping (address => uint) public numberOfPeoplePerAddress;
    
    function createPerson (string memory name1, uint age1, uint height1) public {
        
        Person memory newPerson1;
        newPerson1.name = name1;
        newPerson1.age = age1;
        newPerson1.height = height1;
        newPerson1.origCreator = msg.sender;
        
        if (age1 >= 18) { 
            newPerson1.eighteenOrMore = true;
        } 
        else {
            newPerson1.eighteenOrMore = false;
        }
        addPerson(newPerson1);
        
        numberOfPeoplePerAddress[newPerson1.origCreator] = (numberOfPeoplePerAddress[newPerson1.origCreator] + 1);
    }
    
    function addPerson (Person memory newPerson2) private {
        peopleArray.push(newPerson2);
    }
    
    function getPerson (uint index3) public view returns (string memory name3, uint age3, uint height3, address origCreator3, bool eighteenOrMore3 ) {
        return (peopleArray[index3].name, peopleArray[index3].age, peopleArray[index3].height, peopleArray[index3].origCreator, peopleArray[index3].eighteenOrMore);
    }
   
}