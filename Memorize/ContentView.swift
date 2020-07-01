//
//  ContentView.swift
//  Memorize
//
//  Created by Higor Alves on 01/07/20.
//  Copyright © 2020 Higor Alves Dev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var viewModel: EmojiMemoryGame
	
	var body: some View {
		HStack() {
			ForEach(viewModel.get) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card: card)
				}
			}
		} .foregroundColor(Color.orange)
			.padding()
			.font(Font.largeTitle)
	}
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	
	var body: some View {
		ZStack {
			if(card.isFaceUp) {
				RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
				RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
				Text(card.content)
			} else {
				RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(viewModel: EmojiMemoryGame())
	}
}
