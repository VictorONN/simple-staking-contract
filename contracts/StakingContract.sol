//SPDX/License-Identifier: MIT

pragma solidity 0.8.4;

interface IDepositContract {
    function deposit(
        bytes calldata pubkey,
        bytes calldata withdrawal_credentials,
        bytes calldata signature,
        bytes32 deposit_data_root
    ) external payable;
}

contract StakingContract {
    mapping(address => uint256) public balances;
    mapping(bytes => bool) public pubkeysUsed;
    IDepositContract public depositContract = IDepositContract();
    address public admin;
    uint256 public end;
    bool public finalized;
    uint256 public totalInvested;
    uint256 public totalChange;
    mapping(address => bool) public changeClaimed;

    event NewInvestor(address investor);
}
