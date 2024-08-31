//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../src/horseStoreV1/HorseStore.sol";
import "src/horseStoreV2/IHoreseStore.sol";
import {Test,console2} from "forge-std/Test.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;
    //bytes32 yulCode = "5f3560e01c8063cdfead2e1460245763e026c01714601b575f80fd5b5f545f5260205ff35b602436106032576004355f55005b5f80fd";

    function setUp() public virtual {
        horseStore =IHorseStore(address(new HorseStore()));
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