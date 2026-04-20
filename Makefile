-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil

help:
	@echo "Usage:"
	@echo "  make deploy-sepolia   - Deploy to Sepolia testnet"
	@echo "  make deploy-anvil     - Deploy to local Anvil"
	@echo "  make test             - Run all tests"
	@echo "  make anvil            - Start local Anvil chain"

all: clean install build test

# Build
build:
	forge build

# Test
test:
	forge test

# Clean
clean:
	forge clean

# Install dependencies
install:
	forge install Cyfrin/foundry-devops --no-commit
	forge install smartcontractkit/chainlink-brownie-contracts --no-commit
	forge install foundry-rs/forge-std --no-commit

# Start local Anvil chain
anvil:
	anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

# Snapshot
snapshot:
	forge snapshot

# Format
format:
	forge fmt

# Network args
ANVIL_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

SEPOLIA_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

# Deploy
deploy-anvil:
	forge script script/DeployFundMe.s.sol:DeployFundMe $(ANVIL_ARGS)

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe $(SEPOLIA_ARGS)

# Fund
fund-anvil:
	forge script script/Interactions.s.sol:FundFundMe $(ANVIL_ARGS)

fund-sepolia:
	forge script script/Interactions.s.sol:FundFundMe $(SEPOLIA_ARGS)

# Withdraw
withdraw-anvil:
	forge script script/Interactions.s.sol:WithdrawFundMe $(ANVIL_ARGS)

withdraw-sepolia:
	forge script script/Interactions.s.sol:WithdrawFundMe $(SEPOLIA_ARGS)