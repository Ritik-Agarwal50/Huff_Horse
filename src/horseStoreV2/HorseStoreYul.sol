//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract HorseStoreYul{
    uint256 public horseNumber;
    function updateHorseNumber(uint256 _horseNumber) external {
        assembly {
            sstore(horseNumber.slot, _horseNumber)
        }
    }
    function readNumberOfHorses() external view returns(uint256){
        assembly{
            let num := sload(horseNumber.slot)
            mstore(0,num)
            return (0,0x20)
        }
    }
}