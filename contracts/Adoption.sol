// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Adoption {
  address[16] public animalAdopters;

  function adoptAnimal(uint animalId) public returns (uint) {
    require(animalId >= 0 && animalId <= 15);

    animalAdopters[animalId] = msg.sender;

    return animalId;
  }

  function getAnimalAdopters() public view returns (address[16] memory) {
    return animalAdopters;
  }

	function returnAnimal(uint animalId) public returns (uint) {
 	  require(animalId >= 0 && animalId <= 15);

    // If the animal has been adopted by msg.sender, the animal can be returned
 	  if (animalAdopters[animalId] == msg.sender) {
      // "Return" an animal by setting the address of it's adopter back to 0
 	  	animalAdopters[animalId] = address(0);
 	  }

 	  return animalId;
 	}
}

