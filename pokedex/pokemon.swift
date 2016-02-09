//
//  pokemon.swift
//  pokedex
//
//  Created by Drei on 2016-01-22.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Alamofire

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
	private var _nextEvoID: String!
	private var _nextEvoLvl: String!
	
	private var _pokemonUrl: String!
	
	
	var name: String {
		get		{return _name}
	}
	
	var pokedexID: Int {
		get		{return _pokedexID}
	}
	
	var desc: String {
		get	{
			if _desc == nil {
				return ""
			}
			return _desc
		}
	}
	
	var type: String {
		get	{
			if _type == nil {
				return ""
			}
			return _type
		}
	}
	
	var defense: String {
		get	{
			if _defense == nil {
				return ""
			}
			return _defense
		}
	}
	
	var weight: String {
		get	{
			if _weight == nil {
				return ""
			}
			return _weight
		}
	}
	
	var height: String {
		get	{
			if _height == nil {
				return ""
			}
			return _height
		}
	}
	
	var attack: String {
		get	{
			if _attack == nil {
				return ""
			}
			return _attack
		}
	}
	
	var nextEvo: String {
		get {
			if _nextEvo == nil {
				return ""
			}
			return _nextEvo
		}
	}
	
	var nextEvoID: String {
		get	{
			if _nextEvoID == nil {
				return ""
			}
			return _nextEvoID
		}
	}
	
	var nextEvoLvl: String {
		get	{
			if _nextEvoLvl == nil {
				return ""
			}
			return _nextEvoLvl
		}
	}
	
	init(name: String, pokedexID: Int) {
		self._name = name
		self._pokedexID = pokedexID
		self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(pokedexID)/"
	}
	
	func downloadPokemonDetails(completed: DownloadComplete) {
		let url = NSURL(string: self._pokemonUrl)!
		Alamofire.request(.GET, url).responseJSON { response in
			let result = response.result
			if let dict = result.value as? Dictionary<String, AnyObject> {
				if let weight = dict["weight"] as? String {
					self._weight = weight
				}
				if let height = dict["height"] as? String {
					self._height = height
				}
				if let attack = dict["attack"] as? Int {
					self._attack = "\(attack)"
				}
				if let defense = dict["defense"] as? Int {
					self._defense = "\(defense)"
				}
				if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
					if let name = types[0]["name"] {
						self._type = name.capitalizedString
					}
					if types.count > 1 {
						for var type in types {
							self._type.appendContentsOf("/\(type["name"]?.capitalizedString)")
						}
					}
				} else {
					self._type = ""
				}
				
				if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0{
					if let url = descArr[0]["resource_uri"] {
						let nsUrl = NSURL(string: "\(URL_BASE)\(url)")!
						Alamofire.request(.GET, nsUrl).responseJSON { response in
							let result = response.result
							if let descDict = result.value as? Dictionary<String, AnyObject> {
								if let desc = descDict["description"] as? String {
									self._desc = desc
								}
							}
							completed()
						}
						
					}
				} else {
					self._desc = ""
				}
				
				if let evo = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evo.count > 0 {
					if let to = evo[0]["to"] as? String {
						if to.rangeOfString("mega") == nil {
							self._nextEvo = "Next Evolution: \(to)"
							if let str = evo[0]["resource_uri"] as? String {
								let newStr = str.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
								let numStr = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
								self._nextEvoID = numStr
							}
							if let lvl = evo[0]["level"] as? Int {
								self._nextEvoLvl = "\(lvl)"
							}
						}
					}
				} else {
					
				}
				
				
			}
		}
	}
	
}
