//
//  SetGame.swift
//  SetGame
//
//  Created by Craig Olson on 4/27/23.
//

/// The primary model for our set game
struct SetGame {
    private(set) var cards: [Card]
    
    init() {
        cards = SetGame.generateCards()
    }
    
    private static func generateCards() -> [Card] {
        var cards = [Card]()
        var currentId = 0
        for shape in Card.Shape.allCases {
            for numberOfShapes in 1...3 {
                for pattern in Card.Pattern.allCases {
                    for color in Card.Color.allCases {
                        cards.append(Card(id: currentId, shape: shape, numberOfShapes: numberOfShapes, pattern: pattern, color: color))
                        currentId += 1
                    }
                }
            }
        }
        
        cards.shuffle()
        return cards
    }
    
    struct Card: Identifiable {
        let id: Int
        
        var isSelected = false
        
        let shape: Shape
        let numberOfShapes: Int
        let pattern: Pattern
        let color: Color
        
        enum Shape: CaseIterable {
            case diamond
            case squiggle
            case oval
        }
        
        enum Pattern: CaseIterable {
            case solid
            case striped
            case open
        }
        
        enum Color: CaseIterable {
            case red
            case green
            case purple
        }
    }
}
