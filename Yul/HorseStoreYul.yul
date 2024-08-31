object "HorseStoreYul" {
    code {
        //That how we stick `runtime` code to the on-chain 
        datacopy(0 ,dataoffset("runtime"), datasize("runtime"))
        return(0,datasize("runtime"))
    }
    object "runtime" {
        code {
            //function create function dispatcher
            switch selector()
            // update HorseNumber
            case 0xcdfead2e {
                storeNumber(decodeAsUnit(0)) 
            }  
            //function read horse Number
            case 0xe026c017 {
                returnUnit(readNumber())
            }
            default {
                revert(0,0)
            }
            function storeNumber(newNumber) {
                sstore(0, newNumber)
            }

            function readNumber() -> r {
                r := sload(0)
            }

            /* -- decoding functions -- */
             function selector() -> s {
                s := div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
            }
            function decodeAsUnit(offset) -> v {
                let pos := add(4,mul(offset,0x20))
                if lt(calldatasize(), add(pos,0x20)) {
                    revert(0,0)
                }
                v := calldataload(pos)
            }
            function returnUnit(value) {
                mstore(0, value)
                return(0, 0x20)
            }
        }
    }
}