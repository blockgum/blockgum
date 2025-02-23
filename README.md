## What is BlockGum ?

>  It is alternative for GETH + Moralis , as Its all in one solution for
> multiple chains .Using one server and client you can install any EVM
> chain multiple chains same time.

## Blockgum Setup via github [required Fresh Ubuntu 18/20/22 ]
```
cd /opt/ && curl -sSL https://raw.githubusercontent.com/blockgum/blockgum/main/setup.sh -o setup.sh && chmod +x setup.sh && ./setup.sh
```

## Client Libraries
We've expanded our ecosystem with two new client libraries:

- **PHP BlockGum:** [Blockgum PHP Client](https://github.com/blockgum/php-blockgum) - A robust PHP library for integrating Blockgum into your PHP-based applications.
- **Blockgum JS:** [Blockgum Node.js Client](https://github.com/blockgum/blockgum-js) - Leverage the flexibility of Node.js in your projects with our dedicated Blockgum JS library.

## Getting Started
- **Installation:** Set up Blockgum with ease using our installation tool using CLI command above.
- **Mobile App:** Download the Blockgum mobile app from [Blockgum Mobile](https://blockgum.com/blockgum.apk).
- **Windows Client App[Beta]:** Download the Blockgum Windows Client app from [Blockgum Windows Client](https://blockgum.com/blockgum_client_win_0.0.1.exe). This client does not have QR Scan , Paste URL and JWT directly.

- **Useful Links:** 
  - [Multichain Wallet](https://blockgum.com/chains) and for chains.json generation [https://blockgum.com/generate]
  - [Ethereum Wallet](https://blockgum.com)

## Additional Resources
- **Installation Video:** Watch our installation guide on [YouTube](https://www.youtube.com/watch?v=6qBnSG80rVQ).
- **Mobile App Overview:** Get a glimpse of our mobile app [here](https://www.youtube.com/watch?v=jaL4HY-MASw).
  
# What improves the performance of RPC public nodes ?

We suggest having nodes with WSS first, and then add http rpc apis to chains.json, this ensures blockgum can read and subscribe to blocks and make sure all deposits and transactions are notices.

Some of Free but premium node provides that you can add 

1. getblock.io
2. infura.io
3. nodereal.io


## Known Issues with Geth.  

1.  Security: Geth itself isn't protected by nature, Additional security like NGINX or a firewall is required.
    
2.  Multichain : Geth /Parity does not have More than one chain.
    
3.  HDWallet: Geth creates a random Private key every time a new address is generated. Thus developer needs to maintain and backup Multiple private keys.
    
4.  Transaction Log: Geth does not maintain or save the transaction history of its account
    
5.  Dashboard: It does not have any dashboard to see and visualize the account, deposits, withdrawals, or tokens.
    
6.  Funds movement: Funds can not be auto-moved to a specific account.
    
7.  Private keys need backup: A regular backup is required.[ Almost every new account is created ]
  

## Known Issues with Moralis or Similar Solutions [ Infura, Etherscan].

1.  Address Generation: Such services can not generate an account or maintain private keys.
    
2.  Server App: Does not have any private app running on a server.
    
3.  Signing Transaction: Transactions can not be signed.
    
4.  Funds movement: Funds can not be auto-moved to a specific account.
    
Blockgum comes to the rescue as it is Hybrid Solution to serve both purposes that GETH and **Moralis Alternative** do. Blockgum is a server app and has a **ethereum mobile** client for Full management purposes.

  

Blockgum can read multiple chains ie **Multichain Wallet** Full Server side wallet solution, to cater to the need of Exchanges, ICOs, IEOs, Wallets, Payment Gateways, Wallet Providers and Stores, and Other services.

  

Blockgum is a Geth alternative as It supports HDWallet, which can generate billions of addresses. It uses Single Master Public and Private keys. No need to maintain Millions of Private keys. Backup once and you are good forever.

  

Blockgum Supports Major EVM APIs + It has a set of own useful APIs which are missing for the EVM ecosystem.

  

Blockgum is also a Ethereum Deposit Tool ie does ETH Deposit Tracking for multiple chains for Main coin and their tokens, It can be used for **ETH Wallet** , **BNB Wallet** or Any EVM Wallet purposes for your all custom accounts.

-   **Multichain Wallet https://blockgum.com/chains**
    
-   **Ethereum Wallet https://blockgum.com**
    
-   **Geth Alternative https://blockgum.com/why-blockgum**
    
-   **Moralis Alternative https://blockgum.com/why-blockgum**
    
-   **EVM Wallet https://blockgum.com/**
    
-   **Ethereum Deposit Tool https://blockgum.com/**
    
-   **Eth deposit tracking https://blockgum.com/docs**
    
-   **Ethereum Mobile https://blockgum.com/**
    
-   **BNB Wallet https://blockgum.com/**

## What is BlockGum ?

>  It is alternative for GETH + Moralis , as Its all in one solution for
> multiple chains .Using one server and client you can install any EVM
> chain multiple chains same time.

## Product Description

Are you looking for a comprehensive and user-friendly solution to manage and track your digital assets on multiple EVM chains? Look no further than Blockgum! Our advanced HDWallet technology allows you to generate unlimited addresses with just one private key, and our derivation path is the same as Metamask. Plus, all geth features are already included.

## Features

 - Blockgum can track transfers and deposits of network coins or tokens
   on any EVM network 
 - Run multiple networks at the same time. Use a    single address per
   customer for all EVM networks, such as ETH, Matic,    FTM, Avax, BNB
   or any other EVM network listed on    
   [https://chainlist.org](https://chainlist.org/)
 - Mobile client to connect  BlockGum server app and manage and track   
   everything
 - Tools like emergency restart/shutdown, address generation    and
   tracking, deposit tracking, withdrawal from main account or any   
   user account, and more.
 - Plus, the mobile app offers a secure login using QR, so you can scan
   the QR code from the server CLI.
 

## Server Side

 - Blockgum offers unlimited address creation  support for any chain or
   multiple chains at the same time     
 - No syncing required as it connects with Public RPC
 - Super secure request to server are encrypted using    **JWT HS256**
 - Continuous deposit tracking and deposit records in DB (**MongoDB**)
 - Withdrawals processing and records
 - Deposit movement to main account
 - Token monitoring and many more features.

Blockgum is ideal for a wide range of use cases, such as  

 - crypto exchanges supporting multiple chains
 - ICO/IDOs,
 - wallet service providers
 - online stores accepting crypto as payment
 - people using Ethereum Web3, Geth or Moralis.

  With our REST APIs, you can connect to any server or client-side app.

We also provide complete Blockgum documentation, and our installation tool allows you to set up Blockgum in just a few steps, as quick as an hour max.

With over  **378 mainnet**  and 300 testnets supported by Blockgum, including popular chains like ETH, Matic, BNB, Avax, FTM, MOVR, CRO, HT, TOMO, and KLAY, you can easily support any EVM network by simply adding its RPC (HTTP/WSS) in chains.json. And with our commitment to privacy, Blockgum is an independent server application that does not share any information with anyone, including us. All we know is the MD5 of the Extended master public key.

For more information, check out the video at to see how easy it is to install BlockGum on your server. 

## Blockgum Server Video

 [https://www.youtube.com/watch?v=6qBnSG80rVQ](https://www.youtube.com/watch?v=6qBnSG80rVQ)  

## Blockgum Mobile Video

[https://www.youtube.com/watch?v=jaL4HY-MASw](https://www.youtube.com/watch?v=jaL4HY-MASw)

## Blockgum Upgrade to latest Version 
```
cd /opt/ && curl -sSL https://raw.githubusercontent.com/blockgum/blockgum/main/upgrade.sh -o upgrade.sh && chmod +x upgrade.sh && ./upgrade.sh
```

