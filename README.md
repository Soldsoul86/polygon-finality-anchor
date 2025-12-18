# Polygon Finality Anchor

A minimal, immutable on-chain infrastructure primitive deployed on Polygon
that enables irreversible, value-backed timestamp anchoring.

This repository implements a deliberately small smart contract designed to act as
a foundational finality primitive for Polygon-native systems.

---

## Motivation

Many applications require a cryptographically verifiable way to prove that
some data, intent, or commitment existed at or before a specific point in time.

Existing approaches often introduce one or more of the following risks:

- Administrative control
- Upgradeability
- Withdrawable or recoverable value
- Excess protocol surface area

These properties weaken long-term finality guarantees.

---

## Design Goals

FinalityAnchor is designed around strict principles:

- Immutability by construction
- No upgrade path
- No ownership or admin privileges
- No storage
- No withdrawal mechanism

Once deployed, the contract’s behavior cannot change and its guarantees do not
depend on any external actor.

---

## How It Works

The contract allows anyone to:

1. Send native POL to the contract
2. Optionally attach a bytes32 commitment
3. Emit an on-chain event containing:
   - Sender address
   - Value committed
   - Block number
   - Block timestamp
   - Commitment hash (if provided)

There is no code path for funds to exit the contract.

Every anchor is therefore economically final.

---

## Core Invariants

The following properties always hold:

- Native POL can enter the contract
- No function exists for POL to exit
- Anchored events cannot be altered or invalidated
- The deployer has no post-deployment privileges

Correctness is structural, not governance-dependent.

---

## Deployed Instance (Polygon Amoy Testnet)

- Network: Polygon Amoy Testnet
- Contract: FinalityAnchor
- Contract Address: 0x6CbAfC19Ffb8E8457d62BB2E9bC5E4809cc1bCDf
- Explorer: https://amoy.polygonscan.com/address/0x6CbAfC19Ffb8E8457d62BB2E9bC5E4809cc1bCDf

Polygon’s low-cost and fast finality make it well-suited for frequent,
irreversible anchoring without economic friction.


---

## On-chain Commitments (Proof of Liveness)

The following irreversible commitments were executed on Polygon Amoy,
demonstrating repeated liveness and correct behavior of the primitive.

- Commitment #1 — Value-only anchor  
  https://amoy.polygonscan.com/tx/0xea1a19da5f5c436b20d3e15d29fe65094703f395044e256c57b560b6f2795e52

- Commitment #2 — Value-only anchor  
  https://amoy.polygonscan.com/tx/0xb8adc4b16920dabae8f91156bcbc8da5e77ce651627ba283082e9e500af14fc4

- Commitment #3 — Metadata-based anchor  
  Off-chain message: polygon-anchor-metadata-commitment-1  
  On-chain hash: 0x12344614118f7e766a332658edc7315687932439e4a4fff1f442a84d0f98288b  
  Transaction: https://amoy.polygonscan.com/tx/0x2e9a6046a384f78c3589f6d20eefaf2cb9bbfeef193e9136c49a23b058c071f2

Each transaction permanently locks POL and emits an Anchored event that can be
independently verified via Polygonscan.

---

## Example Use Cases

This primitive is intentionally unopinionated.
Possible constructions include:

- Proof-of-existence systems
- Credible commitments and pledges
- Time-based guarantees (via wrapper contracts)
- Cross-system verification anchors
- Governance or DAO promises
- Social or economic signaling

FinalityAnchor does not implement these directly — it enables them.

---

## Why Polygon

Polygon provides an ideal execution environment for this primitive due to:

- Low transaction costs for frequent anchoring
- Fast and deterministic finality
- Mature EVM tooling and developer ecosystem
- Strong focus on infrastructure-level primitives

The contract is chain-agnostic by design, with Polygon as a first-class deployment.

---

## Repository Structure

contracts/
  FinalityAnchor.sol
scripts/
README.md

---

## Development Status

- Contract deployed on Polygon Amoy
- Multiple irreversible commitments executed
- Metadata-based semantic anchoring demonstrated
- Optional mainnet deployment planned
- Reference integrations and indexing examples planned

---

## License

MIT

---

## Reviewer Note

This repository represents a base-layer infrastructure primitive, not an
end-user application.

Its value emerges from composability and reuse across Polygon-native systems.

---


