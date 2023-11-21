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
cast wallet address --keystore keystore/KEYPAIR
```

where KEYPAIR is the name of the new file. <br/>
Note that you do not need to provide an RPC URL when creating a wallet. <br/>
Check the balance of the new address using cast balance; it should be zero. <br/>
Send some SepETH to your new address using your MetaMask wallet. <br/>
Check the balance of your new address again; verify that the SepETH has arrived. <br/>
You can send the SepETH back to your MetaMask account:
```
cast send TO_ADDRESS \
--value 0.1ether \
--keystore keystore/KEYPAIR \
--from FROM_ADDRESS \
--rpc-url https://rpc.ankr.com/eth_sepolia
```
where TO_ADDRESS is your address in MetaMask and FROM_ADDRESS is your address managed by cast. <br/>
The transaction may take some time to confirm. Check the balance of the new address, one last time, using cast balance. <br/>
Verify that the SepETH has been returned to your MetaMask account.
