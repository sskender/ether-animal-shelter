pragma solidity ^0.4.17;

contract AnimalShelter {

    struct Animal {
        uint id;
        string species;
        uint weight;
        uint8 age;
        bool healthy;
        bool adopted;
        address adoptedBy;
    }


    address private shelter_owner;
    mapping(uint => Animal) private animals;

    uint public animals_count;
    mapping(address => uint) private donors;

    address public top_donor;
    uint public total_donated;

     
    function AnimalShelter() public {

        shelter_owner = msg.sender;
        animals_count = 0;
        total_donated = 0;
    }


    modifier onlyOwner() {

        require(msg.sender == shelter_owner);
        _;
    }


    function addAnimal(string _species, uint _weight, uint8 _age, bool _healthy) onlyOwner public returns (bool) {

        animals[animals_count] = Animal(animals_count, _species, _weight, _age, _healthy, false, 0);
        animals_count++;

        return true;
    }


    function getInfo(uint _id) public constant returns (uint, string, uint, uint8, bool, bool, address) {

        return (animals[_id].id, animals[_id].species, animals[_id].weight, animals[_id].age, animals[_id].healthy, animals[_id].adopted, animals[_id].adoptedBy);
    }


    function donate() public payable returns (bool) {

        if (!shelter_owner.send(msg.value)) {
            return false;
        }

        total_donated += msg.value;
        donors[msg.sender] += msg.value;

        if (donors[msg.sender] > donors[top_donor]) {
            top_donor = msg.sender;
        }

        return true;
    }


    modifier canBeAdopted(uint _id) {

        assert(animals[_id].healthy);
        _;
    }

    
    function adopt(uint _id) canBeAdopted(_id) public returns (bool) {

        animals[_id].adopted = true;
        animals[_id].adoptedBy = msg.sender;

        return true;
    }

}