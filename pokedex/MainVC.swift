//
//  ViewController.swift
//  pokedex
//
//  Created by Drei on 2016-01-22.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var collectionView: UICollectionView!
	var pokemon = [Pokemon]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.delegate = self
		collectionView.dataSource = self
		parseCSV()
	}
	
	// MARK: Collection View Functions
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokemonCell", forIndexPath: indexPath) as? PokemonCell {
			let poke = pokemon[indexPath.row]
			cell.configureCell(poke)
			return cell
		}
		return UICollectionViewCell()
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 718
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
	}
	
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		return CGSizeMake(90, 90)
	}
	
	
	func parseCSV() {
		let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
		do {
			let csv = try CSV(contentsOfURL: path)
			let rows = csv.rows
			for row in rows {
				pokemon.append(Pokemon(name: row["identifier"]!, pokedexID: Int(row["id"]!)!))
			}
		} catch let error as NSError {
			print(error.debugDescription)
		}
	}
	
}

