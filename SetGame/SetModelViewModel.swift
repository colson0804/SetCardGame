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
        return Array(model.cards[0..<12])
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
}
