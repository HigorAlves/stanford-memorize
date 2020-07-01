//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Higor Alves on 01/07/20.
//  Copyright © 2020 Higor Alves Dev. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
	private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
	
	static func createMemoryGame() -> MemoryGame<String> {
		let emojis: Array<String> = ["👻", "🎃", "🕷"]
		return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
			return emojis[pairIndex]
		}
	}
	
	var get: Array<MemoryGame<String>.Card> {
		return model.cards
	}
	
	func choose(card: MemoryGame<String>.Card){
		return model.choose(card: card)
	}
}
