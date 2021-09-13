// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract MyToken {
    mapping(address => uint256) private _balances;
    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) {
        _name = name;
        _symbol = symbol;
        _totalSupply = initialSupply;

        _balances[msg.sender] = initialSupply;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        uint256 senderBalance = _balances[msg.sender];
        require(
            senderBalance >= amount,
            "ERC20: transfer amount exceeds balance"
        );

        _balances[msg.sender] = senderBalance - amount;
        _balances[recipient] += amount;

        return true;
    }
}
