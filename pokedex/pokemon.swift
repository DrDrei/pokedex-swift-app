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
	private var _desc: String!
	private var _type: String!
	private var _defense: String!
	private var _height: String!
	private var _weight: String!
	private var _attack: String!
	private var _nextEvo: String!
	
	
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
