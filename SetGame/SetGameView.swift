//
//  SetGameView.swift
//  SetGame
//
//  Created by Craig Olson on 4/26/23.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game = SetModelViewModel()
    
    var body: some View {
        VStack {
            Text("Score: \(game.score)")
                .font(.headline)
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.selectCard(card)
                    }
            }
            HStack {
                Button("+ Deal 3 Cards") {
                    game.dealThreeCards()
                }
                Spacer()
                Button("New Game") {
                    game.startNewGame()
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    let card: SetGame.Card
    
    var body: some View {
        VStack {
            ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                switch card.shape {
                case .oval:
                    RoundedRectangle(cornerRadius: 50)
                        .fill(with: card)
                case .diamond:
                    Diamond()
                        .fill(with: card)
                case .squiggle:
                    Rectangle()
                        .fill(with: card)
                }
            }
        }
        .cardify(isSelected: card.isSelected)
    }
    
    private struct CardConstants {
        static let cornerRadius: CGFloat = 10
        static let aspectRatio = 2/3
        static let lineWidth: CGFloat = 5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
