//
//  MemoryGame.swift
//  Memorize
//
//  Created by Higor Alves on 01/07/20.
//  Copyright © 2020 Higor Alves Dev. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		cards = Array<Card>()
		
		for pairIndex in 0..<numberOfPairsOfCards {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: pairIndex*2))
			cards.append(Card(content: content, id: pairIndex*2+1))
		}
	}
	
	struct Card: Identifiable {
		var isFaceUp: Bool = true
		var isMatched: Bool = false
		var content: CardContent
		var id: Int
	}
	
	var cards: Array<Card>
	
	func choose(card: Card) {
		print("Card chosen: \(card)")
	}
}
