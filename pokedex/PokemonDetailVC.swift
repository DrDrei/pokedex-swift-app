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
	
	@IBOutlet weak var mainSeg: UISegmentedControl!
	
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
    }

}
