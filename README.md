# Decentralised Vault Manager
Smart contracts can accept, store, and distribute native tokens. <br/>
Solidity, the most popular programming language for writing smart contracts for the EVM, has built-in functionality to support this.

Creating and Deploying a Smart Contract
There are several steps in creating and deploying a smart contract to a local testnet Ethereum node
using Foundry. They are:

Create a local testnet Ethereum node using anvil - [LINK](https://github.com/nigeldouglas-itcarlow/decentralised-vault-manager/blob/main/README.md#a-local-testnet-ethereum-node) <br/>
Create a project for the smart contract using forge - [LINK]() <br/>
Write the code and tests for the smart contract in Solidity. <br/>
Compile the code to create the EVM bytecode and run the tests using forge. <br/>
Deploy the smart contract to the local testnet Ethereum node using forge. <br/>
Interact with the newly deployed smart contract using cast.


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
cast send 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 \
--from 0x97d4bCeEe5651aD0206C603f7d3F1Cd206013821 \
--unlocked \
--value 5000ether \
--rpc-url http://127.0.0.1:8545
```

Note the following:
• The RPC URL is HTTP rather than HTTPS. 
If you wish you can omit the RPC URL altogether and use the default value.
• Your addresses for Account #0 and Account #1 are the same as mine since they are generated using the same mnemonic and BIP39 derivation path.
• You don’t need to provide a private-key. 
This is a convenience provided by Foundry and the ```–unlocked``` flag.
<br/>
Check that the transaction succeeded by using cast balance to retrieve the new balance for the address associated with Account #1:
```
cast balance 0x7B4531C129E1Ae801f910949eA829eE8B804eE98 \
--rpc-url http://127.0.0.1:8545 | cast from-wei
```


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
