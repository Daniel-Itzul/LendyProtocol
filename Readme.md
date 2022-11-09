# The Lendy Project:
## About Lendy
1. The What
- Lendy allows storage providers to borrow Fil againts the future rewards of their Filecoin Storage Deals.
2. The Why
- Provide liquidity to storage providers.
3. The How
- Storage Provider Registration
    - This process links your Storage Provider ID with your Ethereum Address.
    - This gives access to Lendy to asks the Oracle for your Storage Deals.
    - Lendy will show your storage deals
- Lock storage deal
    - You lock an Storage Deal in Lendy to allow the value of the rewards of the deal to serve as collateral for your lending.
    - The rewards of Locked Deals, upon expiration, can only be used to repay loans.
    - Your deals can be unlocked only if you have no outstanding loans.
    - The oracle locks and unlocks the deals
- Borrow
    - You can borrow up to 80% of the value your locked Deals
- Repay
    - You can repay your loans directly with FIL or pay by liquiditing your expired Locked Deals (Only self liquidation is allowed)
## Asumptions:
- An Oracle Service Exist in Filecoin for the following services:
    - Link Filecoin Actor Addresses to Ethereum Addresses, specially Provider Actors IDs.
    - Fetch information about deals and return it as response to smart contract calls from other EVM contracts.
    - Lock future rewards of deals if authorized by the Storage Provider through its related Ethereum Address.
    -  The Oracle service serves on-chain data through an EVM standard smart contract as the interface.
## About this Repo
- This repository contains the Mock Contracts for Lendy in a Foundry Standard Project.
    - Lendy.sol Lendy platform contract 
    - MockOracle mocks the functions assigned to the oracle.
