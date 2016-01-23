//
//  PokemonCell.swift
//  pokedex
//
//  Created by Drei on 2016-01-22.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
	@IBOutlet weak var pokeImage: UIImageView!
	@IBOutlet weak var pokeLabel: UILabel!
	
	var myPokemon: Pokemon!
	
	func configureCell(pokemon: Pokemon) {
		myPokemon = pokemon
		pokeLabel.text = myPokemon.name.capitalizedString
		
		pokeImage.layer.cornerRadius = 5.0
		pokeImage.image = UIImage(named: "\(myPokemon.pokedexID)")
		
	}
}
