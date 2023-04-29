//
//  SetModelViewModel.swift
//  SetGame
//
//  Created by Craig Olson on 4/27/23.
//

import SwiftUI

class SetModelViewModel: ObservableObject {
    typealias Card = SetGame.Card
    @Published var model = SetGame()
    
    // MARK: - Computed Properties
    
    var cards: [Card] {
        return model.drawnCards
    }
    
    var score: Int {
        return model.score
    }
    
    func shape(for card: Card) -> any Shape {
        switch card.shape {
        case .oval:
            return RoundedRectangle(cornerRadius: 20)
        case .diamond:
            return Circle()
        case .squiggle:
            return Rectangle()
        }
    }
    
    // MARK: - Intents
    
    func selectCard(_ card: Card) {
        model.selectCardAndCheckForMatch(card)
    }
    
    func startNewGame() {
        model.startNewGame()
    }
    
    func dealThreeCards() {
        model.dealCards(3)
    }
}
