// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract King {
    using Address for address payable;

    address private _ownerContract;
    uint256 private _pot;
    uint256 private _potOwner;

    constructor(address ownerContract_, uint256 pot_) payable {
        require(msg.value > 1e15, "King: You need to bet at least 1 weis");
        _ownerContract = ownerContract_;
        _pot = pot_;
    }

    function potWinner(address account, uint256 value) external payable {
        require(
            msg.value >= address(this).balance * 2,
            "King: You need have to double the actual pot"
        );
        _pot += msg.value;
    }

    function potOf() public view returns (uint256) {
        return _pot;
    }

    function _pourcent(uint256 amount, uint256 pot_)
        private
        pure
        returns (uint256)
    {
        return (amount * pot_) / 100;
    }
}
