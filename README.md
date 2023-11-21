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
Run the following command in your terminal, then follow the onscreen instructions.
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
cast balance ADDRESS --rpc-url https://rpc.ankr.com/eth_sepolia
```
where ADDRESS is the address in the account. <br/>
Note the use of an RPC URL to specify the Sepolia blockchain. <br/>
The balance is reported in Wei, or more precisely SepWei. <br/>
You can convert the balance to SepETH using:
```
cast balance ADDRESS --rpc-url https://rpc.ankr.com/eth_sepolia | \
cast from-wei
```
If you correctly registered an ENS in last week’s practical, then you can perform an ENS reverse lookup using:
```
cast lookup-address ADDRESS --rpc-url https://rpc.ankr.com/eth_goerli
```
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
