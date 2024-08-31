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

            }  
            //function read horse Number
            case 0xe026c017 {

            }
            default {
                revert(0,0)
            }
            /* -- decoding functions -- */

             function selector() -> s {
                s := div(calldataload(0), exp(2, 224))
             }
        }
    }
}