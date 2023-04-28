//
//  ContentView.swift
//  SetGame
//
//  Created by Craig Olson on 4/26/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = SetModelViewModel()
    
    var body: some View {
        VStack {
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(4)
            }
            .padding()
        }
    }
}

struct CardView: View {
    let card: SetGame.Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CardConstants.cornerRadius)
                .fill(.white)
            RoundedRectangle(cornerRadius: CardConstants.cornerRadius)
                .strokeBorder(.red, lineWidth: CardConstants.lineWidth)
            
            Group {
                switch card.shape {
                case .oval:
                    RoundedRectangle(cornerRadius: 50)
                        .fill(with: card)
                case .diamond:
                    Circle()
                        .fill(with: card)
                case .squiggle:
                    Rectangle()
                        .fill(with: card)
                }
            }
                .padding(15)
        }
    }
    
    private struct CardConstants {
        static let cornerRadius: CGFloat = 10
        static let aspectRatio = 2/3
        static let lineWidth: CGFloat = 5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
