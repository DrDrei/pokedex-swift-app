//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Drei on 2016-01-25.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

	var pokemon: Pokemon!
	
	@IBOutlet weak var pokeNameLbl: UILabel!
	
	@IBOutlet weak var mainImg: UIImageView!
	@IBOutlet weak var currentEvoImg: UIImageView!
	@IBOutlet weak var nextEvoImg: UIImageView!
	
	@IBOutlet weak var descLabel: UILabel!
	@IBOutlet weak var typeLabel: UILabel!
	@IBOutlet weak var defenseLabel: UILabel!
	@IBOutlet weak var heightLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var weightLabel: UILabel!
	@IBOutlet weak var attackLabel: UILabel!
	@IBOutlet weak var evoDescLabel: UILabel!
	
	@IBAction func backPressed() {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	@IBAction func segPressed() {
		
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let img = UIImage(named: "\(pokemon.pokedexID)")
		self.mainImg.image = img
		self.currentEvoImg.image = img
		self.pokeNameLbl.text = pokemon.name.capitalizedString
		pokemon.downloadPokemonDetails { () -> () in
			self.updateUI()
		}
    }
	
	func updateUI() {
		self.descLabel.text = pokemon.desc
		self.typeLabel.text = " \(pokemon.type)"
		self.defenseLabel.text = pokemon.defense
		self.heightLabel.text = pokemon.height
		self.idLabel.text = "\(pokemon.pokedexID)"
		self.weightLabel.text = pokemon.weight
		self.attackLabel.text = pokemon.attack
		if pokemon.nextEvoID == "" {
			self.evoDescLabel.text = "\(pokemon.nextEvo) None"
			self.nextEvoImg.hidden = true
		} else {
			self.evoDescLabel.text = "\(pokemon.nextEvo) at Level \(pokemon.nextEvoLvl)"
			self.nextEvoImg.image = UIImage(named: "\(pokemon.nextEvoID)")
		}
		
		
	}

}
