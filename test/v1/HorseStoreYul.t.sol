pragma solidity 0.8.20;

import {Base_TestV1} from "./Base_TestV1.t.sol";
import {HorseStoreYul} from "../../src/horseStoreV2/HorseStoreYul.sol";
import "src/horseStoreV2/IHoreseStore.sol";
contract HorseStoreSolc is Base_TestV1{
    function setUp() public override{
        horseStore = IHorseStore(address(new HorseStoreYul()));

    }
}