How solidity know which function need to called?
 - At here solidity uses the concept of `function selector` to know which function is called.
   - `Function Selector` is the first 4 bytes of the `keccak256` hash of the function signature.
     - `keccak256` hash is a cryptographic hash function that converts an input into a fixed-size string of bytes.
       - Example -> Suppose there is a function called `transfer(address user,uint256 amount)`
         - We use `keccak256` to hash the function signature `transfer(address,uint256)` and get the hash value.
         - Then we take the first 4 bytes of the hash value and that is the function selector.
         - So, whenever we call the function `transfer(address user,uint256 amount)` we pass the function selector as the first 4 bytes of the data.
           - So, the function selector is used to identify which function is called.

- There are 3 segements in solidity byte code:
  - 1. `Contract Creation`
  - 2. `Runtime`
  - 3. `MetaData`
  
- How solidity know which values need to b kept and what needs to be destroyed?
  - 