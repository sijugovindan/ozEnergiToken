//SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract EnergiToken is Initializable, ERC20Upgradeable, OwnableUpgradeable  {

    function initialize(
        string calldata _name,
        string calldata _symbol
        ) external initializer {
        __ERC20_init(_name, _symbol);
        __Ownable_init();
    }

    /// @dev modifier 'onlyOwner' for access control 
    function mint(address recipient, uint amount) external onlyOwner {
        _mint(recipient, amount);
    }

    function burn(address recipient, uint amount) external onlyOwner{
        _burn(recipient, amount);
    }

    function changeOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }


}



