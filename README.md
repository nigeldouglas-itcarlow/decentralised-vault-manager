# Decentralised Vault Manager
Smart contracts can accept, store, and distribute native tokens. <br/>
Solidity, the most popular programming language for writing smart contracts for the EVM, has built-in functionality to support this.

## Creating and Deploying a Smart Contract
There are several steps in creating and deploying a smart contract to a local testnet Ethereum node using Foundry. They are:

Create a local testnet Ethereum node using anvil - [LINK](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/blob/main/README.md#a-local-testnet-ethereum-node) <br/>
Create a project for the smart contract using forge - [LINK](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/blob/main/README.md#create-a-forge-project) <br/> <br/>
Write the code and tests for the smart contract in Solidity - [LINK](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/blob/main/README.md#write-and-test-code-in-solidity) <br/>
Compile the code to create the EVM bytecode and run the tests using forge - [LINK](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/blob/main/README.md#compile-the-code-and-run-the-tests) <br/> <br/>
Deploy the smart contract to the local testnet Ethereum node using forge - [LINK](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/blob/main/README.md#deploy-the-smart-contract) <br/>
Interact with the newly deployed smart contract using cast - [LINK](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/blob/main/README.md#interact-with-the-deployed-smart-contract)


### Install WSL (Windows Only)
WSL - Windows Subsystem for Linux. <br/>
Check if a WSL distribution is installed
```
wsl --list
```

```
wsl --install -d Ubuntu
```

![ubuntu](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/a71880bc-e590-4f44-a2f9-e50c9398f2c3)

- Username: nigel
- Password: helloworld

## Install Foundry

Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust. <br/>
Run the following command in your terminal, then follow the onscreen instructions. <br/>
https://getfoundry.sh/
```
curl -L https://foundry.paradigm.xyz | bash
```
```
source /home/nigel/.bashrc
```
```
foundryup
```

![foundryup](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/17678c50-e867-4c2f-9ea6-55da8e5e5dbf)

## Cast

You can use cast to perform a variety of operations. <br/>
You can inspect the balance of your account in MetaMask:
```
cast balance 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 --rpc-url https://rpc.ankr.com/eth_sepolia
```
where ADDRESS is the address in the account. <br/>
Note the use of an RPC URL to specify the Sepolia blockchain. <br/>
The balance is reported in Wei, or more precisely SepWei. <br/>
You can convert the balance to SepETH using:
```
cast balance 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 --rpc-url https://rpc.ankr.com/eth_sepolia | \
cast from-wei
```
If you correctly registered a decentralized domain (ENS), then you can perform an ENS reverse lookup using:
```
cast lookup-address 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 --rpc-url https://rpc.ankr.com/eth_goerli
```

ENS does not yet support the Sepolia network. Visit ENS at ```https://ens.domains```. <br/>
ENS is a decentralised DNS. It enables us to buy secure, private, censorship-resistant domains (.eth) domain names. <br/>
<br/>
Launch the application. Connect your wallet. Make sure you are connected to the Gorli network. <br/>
This is an older testnet network. Search for a name; try to pick one that no one else has taken. <br/>
<br/>
Please note that this name will be published to the Gorli blockchain and linked with your EVM-compatible address. <br/>
Register the name and set it as your primary ENS name. Since my EVM address does not have an ENS, I get this error.

![ens](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/51f18a27-3008-4ae9-b7bb-2e0cf12069e0)




where ADDRESS is your address. <br/>
If this returns, say, foobar123.eth, then you can inspect your balance using:
```
cast balance foobar123.eth --rpc-url https://rpc.ankr.com/eth_goerli \
| cast from-wei
```
You can create a new wallet and store the public-private keypair in a directory named keystore:
```
cd
mkdir keystore
cast wallet new keystore
```

- Secret: ```helloworld```
- Created new encrypted keystore file: ```/home/nigel/keystore/1177339e-067a-4dfb-ab5d-6669c7f6a1a1```
- Address: ```0x97d4bCeEe5651aD0206C603f7d3F1Cd206013821```

![helloworld](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/724503a9-1146-4b54-98ae-29186a7c33d6)


The keypair will be stored in a new file in the keystore directory. <br/> 
You can inspect the address associated with the keypair using:
```
cast wallet address --keystore keystore/1177339e-067a-4dfb-ab5d-6669c7f6a1a1
```

- Enter keystore password: ```helloworld```

![keystore](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/69c13221-dd91-4811-b3ab-57a0d8350bde)


where KEYPAIR is the name of the new file. <br/>
Note that you do not need to provide an RPC URL when creating a wallet. <br/>
Check the balance of the new address using cast balance; it should be zero. <br/>
Send some SepETH to your new address using your MetaMask wallet. <br/>
Check the balance of your new address again; verify that the SepETH has arrived. <br/>
You can send the SepETH back to your MetaMask account:
```
cast send 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 \
--value 0.1ether \
--keystore 1177339e-067a-4dfb-ab5d-6669c7f6a1a1 \
--from 0x97d4bCeEe5651aD0206C603f7d3F1Cd206013821 \
--rpc-url https://rpc.ankr.com/eth_sepolia
```
where TO_ADDRESS (0x7B4531C129E1Ae801f910949eA829eE8B804eE98) is the address in MetaMask <br/>
and the FROM_ADDRESS (0x97d4bCeEe5651aD0206C603f7d3F1Cd206013821) is the address managed by cast. <br/>
<br/>
The transaction may take some time to confirm. Check the balance of the new address, one last time, using cast balance. <br/>
Verify that the SepETH has been returned to your MetaMask account.


![funds](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/a269a11e-4681-490f-9f20-1c1d22c2500b)

It worked! I just didn't mine enough Sepolia to perform the transaction.


## The ETH_RPC_URL Environment Variable
With ```cast```, you can use an environment variable, ```ETH_RPC_URL```, to avoid having to type the ```--rpc-url``` option for each command:
```
cast client --rpc-url=https://rpc.ankr.com/eth_sepolia
```
erigon/2.54.0/linux-amd64/go1.20.5
```
export ETH_RPC_URL=https://rpc.ankr.com/eth_sepolia
```
```
echo $ETH_RPC_URL
```
https://rpc.ankr.com/eth_sepolia
```
cast client
```
erigon/2.54.0/linux-amd64/go1.20.5

![client](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/ee730f9b-f003-41f2-9997-e976f234e9ab)

### Token Units
cast has three commands for converting between Ethereum units: ```cast to-unit```, ```cast from-wei```, and ```cast to-wei```. <br/> 
You can use these commands as part of a command pipeline, e.g.,:
```
echo 1234567890 | cast from-wei
```

![wei](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/22427824-b139-4d92-ba69-187d90912433)


### Transaction Hashes
You can inspect the details of a transaction: <br/>
https://sepolia.etherscan.io/tx/0x4bd1af1f91fb495abbffe88420829fe08069e346e47484806cba3c0fa1bf5dbf
```
cast tx 0x4bd1af1f91fb495abbffe88420829fe08069e346e47484806cba3c0fa1bf5dbf --rpc-url https://rpc.ankr.com/eth_sepolia
```

![transaction](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/1d129f70-83db-49fd-b2bc-9388437e2184)




where ```TRANSACTION_HASH``` is the hash of any transaction on the Sepolia blockchain. <br/>
Some of the fields are contained within the transaction itself; some are external to the transaction. <br/>
You can inspect the values for the fields contained within the transaction: nonce, gasPrice, gasLimit, recipient, value, data, v, r, and s. <br/>
You can inspect the “```raw```” data in a transaction:
```
cast rpc eth_getRawTransactionByHash TRANSACTION_HASH \
--rpc-url https://rpc.ankr.com/eth_sepolia
```

where ```TRANSACTION_HASH``` is the hash of the same transaction. <br/> 
This uses an undocumented RPC call that is widely supported by Ethereum RPC nodes. <br/>
<br/>
You can hash the raw data to compute the transaction hash:
```
cast rpc eth_getRawTransactionByHash TRANSACTION_HASH \
--rpc-url https://rpc.ankr.com/eth_sepolia | \
xargs cast keccak
```

![code](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/58899a63-7b41-41b0-a986-0b5f4111f0e9)


Verify that the transaction hash matches the one you used to lookup the transaction in the first place.



### Transaction Nonces
Verify that you have a non-zero balance of SepETH in your wallet:
```
cast wallet address --keystore 1177339e-067a-4dfb-ab5d-6669c7f6a1a1
cast balance 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 --rpc-url https://rpc.ankr.com/eth_sepolia | \
cast from-wei
```

![key](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/a6213179-6def-4c89-981a-6773e142ced2)



where KEYPAIR is the name of the file in your keystore directory that you created in last week’s practical, and ADDRESS is your address. <br/>
Remember that each transaction requires a nonce: a number that is used only once with respect to each address. <br/>
<br/>
The first transaction sent from an address will have nonce 0, the second will have nonce 1, etc.
Get the next available nonce for your ADDRESS:
```
cast nonce 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 --rpc-url https://rpc.ankr.com/eth_sepolia
```
If the next available nonce is 0, then that indicates that you have not created any transactions from this address on the Sepolia network. <br/>
If it has a value of, say, 42, then that indicates that you have created forty-two transactions, with nonce values 0 to 41 inclusive. <br/>

![cast](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/f9525d89-42c6-4531-b281-34e22adc89f6)


Your next transaction needs to have the nonce 42. <br/> 
If you create a transaction with a nonce less than 42 then it will be invalid. <br/>
<br/>
If you create a transaction with a nonce greater than 42 then it cannot confirm before a transaction with a nonce equal to 42. <br/>
You can manually specify the nonce when sending a transaction. <br/>
<br/>
You can send 0.1 SepETH to yourself using:
```
cast send 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 \
--value 0.1ether \
--keystore 1177339e-067a-4dfb-ab5d-6669c7f6a1a1 \
--from 0x97d4bCeEe5651aD0206C603f7d3F1Cd206013821 \
--nonce NONCE \
--rpc-url https://rpc.ankr.com/eth_sepolia
```
where ```ADDRESS``` and ```KEYPAIR``` are as before and ```NONCE``` is your next available nonce. The transaction should confirm. <br/> 
If you inspect your address at ```sepolia-etherscan```, we should be able to find the transaction. <br/>
https://sepolia.etherscan.io/address/0x7B4531C129E1Ae801f910949eA829eE8B804eE98 <br/>
<br/>
What happens if you try to send a transaction where the nonce value is too low or too high? <br/> 
In either case, the transaction should not confirm. <br/> 
<br/>
If you inspect your address at https://sepolia.etherscan.io, you should be unable to find the transaction. <br/>
Right now I've been running into issues with insufficient funds to perform transactions.

![funds](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/33a9878f-6c8b-41f5-938a-251ddde3d308)


#### Transaction Fees
Check the current gas price on the Sepolia network:
```
cast gas-price --rpc-url https://rpc.ankr.com/eth_sepolia | \
xargs -I {} cast --to-unit {} gwei
```
To check the current gas price on Ethereum mainnet, change the RPC URL:
```
cast gas-price --rpc-url https://rpc.ankr.com/eth | \
xargs -I {} cast --to-unit {} gwei
```
Verify that this price approximately matches the price shown on https://ethgasprice.org. <br/>
You can manually specify the gas price and gas limit when sending a transaction. <br/> 
Again, you can send 0.1 SepETH to yourself using:
```
cast send 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 \
--value 0.1ether \
--keystore 1177339e-067a-4dfb-ab5d-6669c7f6a1a1 \
--from 0x97d4bCeEe5651aD0206C603f7d3F1Cd206013821 \
--nonce NONCE \
--gas-limit 21000 \
--gas-price 4.632027903 \
--rpc-url https://rpc.ankr.com/eth_sepolia
```

![labs](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/dd461511-36d4-4799-a20d-905dffffc915)


where ADDRESS and KEYPAIR are as above, NONCE is your next available nonce, and CURRENT_GAS_PRICE is the current gas price on the Sepolia network in wei. <br/>
Also note that this transaction sets the gas limit to 21 000; this is the minimum required for a standard Ethereum transfer. <br/>
The transaction should confirm. If you inspect your address at https://sepolia.etherscan.io, you should be able to find the transaction.

- What happens if you try to send a transaction where the gas limit is higher or lower than 21 000?
- What happens if you try to send a transaction where the gas price is higher or lower than the current gas price?
- If the gas price is higher than the current gas price, then it should confirm.
- If the gas price is too low, then the transaction may not confirm, now or ever.

#### “Stuck” Transactions
I'm not sure if the previous transaction was stuck. Basically, When a transaction does not confirm due to a low gas price, it is said to be “stuck”. <br/>
This can cause issues, as all future transactions with higher nonce values cannot confirm until the “stuck” transaction becomes unstuck. <br/>
<br/>
The solution is either to wait and hope that the transaction is eventually confirmed, or to create a new transaction with the same nonce value but with a higher gas price. <br/>
This is known as a replacement transaction.

## A Local Testnet Ethereum Node
In previous practicals, we used the Sepolia blockchain rather than the Ethereum mainnet blockchain, primarily to avoid transaction fees. <br/>
However, we still needed testnet ether (SepETH) and we had little control over the operation of the blockchain itself. <br/>

We can use ```anvil```, one of the tools in the Foundry toolkit, to create a local testnet Ethereum node, that is, an Ethereum node that creates and manages its own, local blockchain. We can update the Foundry toolkit using:
```
foundryup
```
We can create a local testnet Ethereum node using:
```
anvil
```

![anvil](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/f714c3dc-d44d-4a29-9291-eb8a7ff6ce73)


You will need to ```keep anvil running in its own terminal```. <br/>
The output displays a list of accounts and private-keys available for use, as well as the address and port that the node is listening on. 

![accounts](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/cfd5aae3-387c-4add-8772-345e7028bb12)


By default, the node will automatically generate a new block as soon as a transaction is submitted. <br/>
This is very convenient for testing purposes. <br/>
<br/>
In some cases a local testnet has advantages over a shared testnet like Sepolia. <br/>
For example, we can experiment with arbitrary amounts of testnet ether, we can control the rate at which blocks are generated, and we can experiment without fear of leaking any data publicly. <br/>
<br/>
There are also some disadvantages: 
- the behaviour of the blockchain is further from the behaviour of Ethereum mainnet (e.g., gas prices, block generation, etc.)
- and we cannot use a shared block explorer such as Etherscan.

As in the previous practicals, we can use cast to create transactions. <br/>
Let’s send 5000 testnet ether from Account #1 to Account #0:

```
cast send 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 \
--from 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 \
--unlocked \
--value 5000ether \
--rpc-url http://127.0.0.1:8545
```

![anvil2](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/90362e5c-04ce-47a5-99be-500c9cec762e)


Note the following: <br/>
• The RPC URL is HTTP rather than HTTPS. <br/>
If you wish you can omit the RPC URL altogether and use the default value. <br/>
• Your addresses for Account #0 and Account #1 are the same as mine since they are generated using the same mnemonic and BIP39 derivation path. <br/>
• You don’t need to provide a private-key. <br/>
This is a convenience provided by Foundry and the ```–unlocked``` flag. <br/>
<br/>
Check that the transaction succeeded by using cast balance to retrieve the new balance for the address associated with Account #1:
```
cast balance 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 \
--rpc-url http://127.0.0.1:8545 | cast from-wei
```

![balance](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/b85be2f1-8f74-432c-b18d-a79cb1bff3c0)


## Create a Forge Project
Next, we will create a project for the smart contract using forge, yet another tool in the Foundry toolkit. <br/>
forge initialises, builds, tests, and deploys smart contracts. We can initialise a new project using:
```
forge init --no-git counter-contract
```
The project will be placed in a directory named counter-contract. <br/>
By default forge also initialises a ```git``` repository and uses git submodules to manage dependencies. <br/>
If you are unfamiliar with git, and git submodules in particular, I suggest supplying the ```--no-git``` option to skip this step. <br/>
Inspect the folder structure in ```counter-contract```. The source code is in src, third-party libraries are in ```lib```, tests are in ```test```, and scripts, including deployment scripts, are in ```script```.

![forge](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/4764f1a9-8525-4b6a-8dc4-f477e73afd34)

## Write and Test Code in Solidity
Inspect the smart contract in ```counter-contract/src/Counter.sol```. <br/>
The contract is very simple: it stores a single number and provides 2 functions that can be called by anyone: <br/>
- the first, ```setNumber()``` replaces the old number with a new number;
- the second, ```increment()``` increases the value of the number by one.

Inspect the corresponding tests in ```counter-contract/test/Counter.t.sol```. <br/>
It constructs an instance of the Counter contract, sets its value to 0, increments the value, checks that the value is now 1, sets the value to some arbitrary number, and checks that the value now matches the new number.

![counters](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/d28f273b-e626-4502-a2d4-551ded6ebedd)


##  Compile the Code (and Run the Tests)
We can compile the contract using:
```
forge build
```
Under the hood, forge compiles the source code, libraries, tests, and scripts in Solidity to EVM bytecode using a Solidity compiler.
The output is placed in out. For example, you can find the EVM bytecode for the Counter contract in ```counter-contract/out/Counter.sol/Counter.json```. <br/>
<br/>
It is stored under the "bytecode" key in the JSON file.
We can test the the contract behaves as expected using:
```
forge test
```
There are two test functions, ```testIncrement()``` and ```testSetNumber()```. <br/> 

1. The first is run once and passes.
2. The second is run many times (see runs: 256 in the output) using different numbers, and passes each time.
<br/>
This form of testing is known as property-based testing: it is a way of testing general behaviours as opposed to isolated scenarios. <br/>
In the output, µ (Greek letter mu) is the mean gas used across all runs and ∼ (tilde) is the median gas used across all runs. <br/>
In fact, you can use ```forge test --gas-report``` to get a more detailed gas report on a per-function basis.

![gas](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/17ce7b09-97d9-4679-80b4-b4dce5b8695d)


## Deploy the Smart Contract
We are ready to deploy the smart contract to our local testnet Ethereum node. <br/> 
We need to provide some configuration and specify a deployment script to make this work.<br/>
<br/>
We start by providing some environment variables. <br/>
Create a file called ```.env``` and add the following lines:

```
RPC_URL=http://127.0.0.1:8545
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```
Then open ```foundry.toml``` and add the following lines:

```
[rpc_endpoints]
local = "${RPC_URL}"
```

This points the RPC URL to our local testnet Ethereum node. <br/>
Replace the contents of ```script/Counter.s.sol``` with the following:

```
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Script, console2 } from "forge-std/Script.sol";
import "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        
        Counter ctr = new Counter();
        
        vm.stopBroadcast();
    }
}
```
This deploys our Counter contract. The entry point is the run() function. <br/> 
It loads in the private-key from .env. vm.startBroadcast() and vm.stopBroadcast() are ‘cheatcodes’ that record contract calls and contract deployments. <br/> 

![scripts](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/89c853be-e05b-4ce9-9158-3acb160408df)


Here we simply create an instance of the Counter contract; this is broadcast to our local testnet Ethereum node as a contract deployment.
Now we can run the deployment script:
```
forge script script/Counter.s.sol:CounterScript --rpc-url local --broadcast
```

![evm](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/assets/126002808/4ac8c565-dab1-4c6a-ac04-20b9607bd212)


Congratulations! We have now deployed a smart contract to our local testnet Ethereum node. <br/> 
Check the output for the address of the Contract Account.

## Interact with the Deployed Smart Contract
Once we have deployed our smart contract we can interact with it directly using cast. <br/>
For example, to retrieve the current value stored by the counter, we can use:
```
cast call CONTRACT_ADDRESS "number()(uint256)" \
--rpc-url local
```
where CONTRACT_ADDRESS is the address of the Contract Account. <br/>
The call should return 0, as the counter is implicitly initialised to that value. <br/>
<br/>
Next, we can try to increment the counter:
```
cast send CONTRACT_ADDRESS "increment()()" \
--from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 \
--unlocked \
--rpc-url local
```
Note we need to use cast send instead of cast call since we are writing data to the blockchain rather than just reading data. <br/>
We need to create a transaction to do this. <br/>
<br/>
Also, we need to provide an address to send the transaction from; we can use any of the addresses provided by anvil. <br/>
Did it work? Re-run the cast call command and verify that the counter has increased by one. <br/> 
<br/>
Repeat the exercise with the setNumber() function, setting the counter to an arbitrary value. <br/>
Again, verify that it worked. <br/>
<br/>
Update the smart contract so that we can either increment or decrement the counter. <br/>
Add an appropriate test. Re-deploy the contract and verify that new the function works as expected
