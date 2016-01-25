//
//  ViewController.swift
//  pokedex
//
//  Created by Drei on 2016-01-22.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
	
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var searchBar: UISearchBar!
	var unfilteredPokemon = [Pokemon]()
	var filteredPokemon = [Pokemon]()
	var inSearchMode = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		searchBar.delegate = self
		searchBar.returnKeyType = UIReturnKeyType.Done
		
		
		parseCSV()
	}
	
	// MARK: Collection View Functions
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokemonCell", forIndexPath: indexPath) as? PokemonCell {
			let pokemon: Pokemon!
			if inSearchMode {
				pokemon = filteredPokemon[indexPath.row]
			} else {
				pokemon = unfilteredPokemon[indexPath.row]
			}
			
			cell.configureCell(pokemon)
			return cell
		}
		return UICollectionViewCell()
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if inSearchMode {
			return filteredPokemon.count
		}
		return unfilteredPokemon.count
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		var pokemon: Pokemon!
		if inSearchMode {
			pokemon = filteredPokemon[indexPath.row]
		} else {
			pokemon = unfilteredPokemon[indexPath.row]
		}
		
		performSegueWithIdentifier("pokemonDetailVC", sender: pokemon!)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "pokemonDetailVC" {
			if let detailVC = segue.destinationViewController as? PokemonDetailVC {
				if let pokemon = sender as? Pokemon {
					detailVC.pokemon = pokemon
				}
			}
		}
	}
	
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		return CGSizeMake(90, 90)
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		view.endEditing(true)
		collectionView.endEditing(true)
	}
	
	func parseCSV() {
		let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
		do {
			let csv = try CSV(contentsOfURL: path)
			let rows = csv.rows
			for row in rows {
				unfilteredPokemon.append(Pokemon(name: row["identifier"]!, pokedexID: Int(row["id"]!)!))
			}
		} catch let error as NSError {
			print(error.debugDescription)
		}
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		view.endEditing(true)
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		if searchBar.text == nil || searchBar.text == "" {
			inSearchMode = false
			view.endEditing(true)
		} else {
			inSearchMode = true
			let searchWord = searchBar.text!.lowercaseString
			filteredPokemon = unfilteredPokemon.filter({$0.name.rangeOfString(searchWord) != nil})
		}
		collectionView.reloadData()
	}
	
}

