// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// https://eips.ethereum.org/EIPS/eip-721
contract PokeDIO is ERC721, ERC721Burnable, Ownable {

    struct Pokemon {
        string name;
        uint level;
        string img;
    }

    Pokemon[] public pokemons;

    constructor() ERC721 ("PokeDIO", "PKD") Ownable(msg.sender) {}

    modifier onlyOwnerOf(uint _monsterId) {
        require(_exists(_monsterId), "Pokemon does not exist."); // Check if the token exists
        require(ownerOf(_monsterId) == msg.sender, "Only the owner can use this Pokemon");
        _;
    }

    function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon) {
        require(_exists(_defendingPokemon), "Defending Pokemon does not exist."); // Ensure defending Pokemon exists
        Pokemon storage attackingPokemon = pokemons[_attackingPokemon];
        Pokemon storage defendingPokemon = pokemons[_defendingPokemon];    
        if (attackingPokemon.level > defendingPokemon.level) {
            address defendingPokemonOwner = ownerOf(_defendingPokemon);
            _transfer(defendingPokemonOwner, msg.sender, _defendingPokemon); // Correct transfer
            _burn(_defendingPokemon);
            pokemons[_attackingPokemon].level += 1; // Update the level in the array
        } else {
            _burn(_attackingPokemon);
        }
    }


    function createNewPokemon(string memory _name, address _to, string memory _img) public onlyOwner {
        uint id = pokemons.length;
        pokemons.push(Pokemon(_name, 1, _img));
        _safeMint(_to, id);
    }

    // Override supportsInterface to signal that this contract supports ERC721Burnable
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721) returns (bool) {
        return interfaceId == type(ERC721Burnable).interfaceId || super.supportsInterface(interfaceId);
    }
}