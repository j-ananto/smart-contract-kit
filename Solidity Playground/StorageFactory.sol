// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0<0.9.0;

import "./SimpleStorage.sol";


// "is" is an inheritance function.
contract StorageFactory is SimpleStorage {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public{
        
        // create an object of TYPE SimpleStorage,
        // variable is named simpleStorage
        // ^^ This is gonna be a new SimpleStorage contract.
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // 2 Things to interact with a contract
        // Address
        // ABI 
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        return simpleStorage.retrieve();
    }
}

// RECAP (NEEDS REVIEW):
// - Learned import chunks of code from other files
// - Learned about inheritance
// - Learned to deploy contracts from a contract
// - Learned how to interact with different contracts from outside our contract 
