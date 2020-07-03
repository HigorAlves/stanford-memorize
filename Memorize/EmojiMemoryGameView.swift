//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Higor Alves on 01/07/20.
//  Copyright © 2020 Higor Alves Dev. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	
	var body: some View {
		HStack() {
			ForEach(viewModel.get) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card: card)
				}
			}
		} .foregroundColor(Color.orange)
			.padding()
	}
}

struct CardView: View {
	let CORNER_RADIUS: CGFloat = 10.0
	let EDGE_LINE_WIDTH: CGFloat = 3
	let FONT_SCALE_FACTOR: CGFloat = 0.75
	
	var card: MemoryGame<String>.Card
	
	func fontSize(for size: CGSize) -> CGFloat {
		return min(size.width, size.height) * FONT_SCALE_FACTOR
	}
	
	func body(for size: CGSize) -> some View {
		ZStack {
			if(card.isFaceUp) {
				RoundedRectangle(cornerRadius: CORNER_RADIUS).fill(Color.white)
				RoundedRectangle(cornerRadius: CORNER_RADIUS).stroke(lineWidth: EDGE_LINE_WIDTH)
				Text(card.content)
			} else {
				RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
			}
		}.font(Font.system(size: fontSize(for: size)))
	}
	
	var body: some View {
		GeometryReader{ geometry in
			self.body(for: geometry.size)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		EmojiMemoryGameView(viewModel: EmojiMemoryGame())
	}
}
