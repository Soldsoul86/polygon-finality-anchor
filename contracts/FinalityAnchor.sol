// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FinalityAnchor {
    event Anchored(
        address indexed sender,
        uint256 value,
        uint256 blockNumber,
        uint256 timestamp,
        bytes32 commitment
    );

    receive() external payable {
        emit Anchored(
            msg.sender,
            msg.value,
            block.number,
            block.timestamp,
            bytes32(0)
        );
    }

    function anchor(bytes32 commitment) external payable {
        emit Anchored(
            msg.sender,
            msg.value,
            block.number,
            block.timestamp,
            commitment
        );
    }
}

