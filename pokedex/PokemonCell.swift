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
	@IBOutlet weak var pokeBG: UIView!
	
	var myPokemon: Pokemon!
	
	func configureCell(pokemon: Pokemon) {
		myPokemon = pokemon
		pokeLabel.text = myPokemon.name.capitalizedString
		pokeImage.image = UIImage(named: "\(myPokemon.pokedexID)")
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.layer.cornerRadius = 5.0
	}
}
