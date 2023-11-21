# Decentralised Vault Manager
Smart contracts can accept, store, and distribute native tokens. <br/>
Solidity, the most popular programming language for writing smart contracts for the EVM, has built-in functionality to support this.

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
You can inspect the details of a transaction:
```
cast tx TRANSACTION_HASH --rpc-url https://rpc.ankr.com/eth_sepolia
```
where TRANSACTION_HASH is the hash of any transaction on the Sepolia blockchain. <br/>
Some of the fields are contained within the transaction itself; some are external to the transaction. <br/>
You can inspect the values for the fields contained within the transaction: nonce, gasPrice, gasLimit, recipient, value, data, v, r, and s. <br/>
You can inspect the “raw” data in a transaction:
```
cast rpc eth_getRawTransactionByHash TRANSACTION_HASH \
--rpc-url https://rpc.ankr.com/eth_sepolia
```

where TRANSACTION_HASH is the hash of the same transaction. <br/> 
This uses an undocumented RPC call that is widely supported by Ethereum RPC nodes. <br/>
<br/>
You can hash the raw data to compute the transaction hash:
```
cast rpc eth_getRawTransactionByHash TRANSACTION_HASH \
--rpc-url https://rpc.ankr.com/eth_sepolia | \
xargs cast keccak
```
Verify that the transaction hash matches the one you used to lookup the transaction in the first place.

