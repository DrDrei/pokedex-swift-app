//
//  pokemon.swift
//  pokedex
//
//  Created by Drei on 2016-01-22.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class Pokemon: AnyObject {
	private var _name: String!
	private var _pokedexID: Int!
	
	var name: String {
		get		{return _name}
	}
	
	var pokedexID: Int {
		get		{return _pokedexID}
	}
	
	init(name: String, pokedexID: Int) {
		self._name = name
		self._pokedexID = pokedexID
	}
}
