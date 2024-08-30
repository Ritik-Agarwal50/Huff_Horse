//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../src/horseStoreV1/HorseStore.sol";
import {Test,console2} from "forge-std/Test.sol";

abstract contract Base_TestV1 is Test {
    HorseStore public horseStore;

    function setUp() public virtual {
        horseStore = new HorseStore();
    }
    function testReadValue() public view {
        uint256 initialValue = horseStore.readNumberOfHorses();
        console2.log("Initial value: ", initialValue);
        assertEq(initialValue, 0, "Initial value should be 0");
    }
    function testWriteValues()public{
        uint256 numberOfHorses = 777;
        horseStore.updateHorseNumber(numberOfHorses);
        assertEq(horseStore.readNumberOfHorses(), numberOfHorses, "Number of horses should be 10");

    }
}