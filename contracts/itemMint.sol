// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ItemMint is ERC1155, Ownable {
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant SWORD = 2;
    uint256 public constant SHIELD = 3;
    uint256 public constant CROWN = 4;
    string public name = "AwesomeGame";
    string public symbol = "AWGA";

    constructor()
        ERC1155(
            "ipfs://QmSEr45V3L1wkgb1tBufyCxf3iAe7q8K7G5dAQFWMuAkMm/{id}.json"
        )
    {
        _mint(msg.sender, GOLD, 10 ** 18, "");
        _mint(msg.sender, SILVER, 10 ** 18, "");
        _mint(msg.sender, SWORD, 1000, "");
        _mint(msg.sender, SHIELD, 1000, "");
        _mint(msg.sender, CROWN, 1, "");
    }

    function uri(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "ipfs://QmSEr45V3L1wkgb1tBufyCxf3iAe7q8K7G5dAQFWMuAkMm/",
                    Strings.toString(_tokenId),
                    ".json"
                )
            );
    }

    function mintGold(uint256 amount, address to) public returns (uint256) {
        // require(amount < ....., "Golds have already been minted");
        _mint(to, GOLD, amount, "");
        return amount;
    }

    function mintSword(uint256 amount, address to) public returns (uint256) {
        // require(amount < ....., "Swords have already been minted");
        _mint(to, SWORD, amount, "");
        return amount;
    }

    function mintCrown(address to) public onlyOwner returns (uint256) {
        require(CROWN > 0, "Crown have already been minted");

        _mint(to, CROWN, 1, "");

        return 1;
    }
}
