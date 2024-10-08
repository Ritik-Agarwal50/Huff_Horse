pragma solidity 0.8.20;

import {Base_TestV1, IHorseStore} from "./Base_TestV1.t.sol";
import {HuffDeployer} from "lib/foundry-huff/src/HuffDeployer.sol";

contract HorseStoreHuff is Base_TestV1 {
    string public constant HORSE_STORE_HUFF_LOC = "horseStoreV1/HorseStore";

    function setUp() public override {
        horseStore = IHorseStore(
            HuffDeployer.config().deploy(HORSE_STORE_HUFF_LOC)
        );
    }
}
