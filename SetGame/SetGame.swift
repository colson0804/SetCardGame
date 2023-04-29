//
//  SetGame.swift
//  SetGame
//
//  Created by Craig Olson on 4/27/23.
//

/// The primary model for our set game
struct SetGame {
    private(set) var score = 0
//    private(set) var cardsToDisplay = 12
    // Cards in the deck
    private(set) var cards: [Card]
    // Cards displayed to the player
    var drawnCards: [Card]
    
    init() {
        cards = SetGame.generateCards()
        drawnCards = Array(cards.prefix(12))
        cards.removeFirst(12)
        
        print(cards.count)
        print(drawnCards.count)
    }
    
    mutating func selectCardAndCheckForMatch(_ card: Card) {
        guard let chosenIndex = drawnCards.firstIndex(where: { $0.id == card.id }) else {
            return
        }
        
        if drawnCards[chosenIndex].isSelected {
            drawnCards[chosenIndex].isSelected = false
        } else {
            var selectedCount = drawnCards.filter { $0.isSelected }.count
            if selectedCount < 3 {
                drawnCards[chosenIndex].isSelected = true
                selectedCount += 1
            }
            
            if selectedCount == 3 {
                if checkMatch() {
                    print("Is a match!!")
                    handleMatch()
                } else {
                    print("NOT a match")
                }
            }
        }
    }
    
    mutating func handleMatch() {
        score += 1
        
        for (index, card) in drawnCards.enumerated() {
            guard !cards.isEmpty else {
                return
            }
            
            if card.isSelected {
                if !cards.isEmpty {
                    drawnCards[index] = cards.removeFirst()
                }
            }
        }
    }
    
    private func checkMatch() -> Bool {
        let selectedCards = drawnCards.filter { $0.isSelected }
        if selectedCards.count == 3 {
            let shapes = selectedCards.map { $0.shape }
            let isShapeValid = shapes.allEqual() || shapes.allUnequal()
            
            let numberOfShapes = selectedCards.map { $0.numberOfShapes }
            let isNumberOfShapesValid = numberOfShapes.allEqual() || numberOfShapes.allUnequal()
            
            let patterns = selectedCards.map { $0.pattern }
            let isPatternsValid = patterns.allEqual() || patterns.allUnequal()
            
            let colors = selectedCards.map { $0.color }
            let isColorsValid = colors.allEqual() || colors.allUnequal()
            
            return isShapeValid && isNumberOfShapesValid && isPatternsValid && isColorsValid
        }
        
        return false
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

private extension Array where Element: Equatable & Hashable {
    func allEqual() -> Bool {
        self.allSatisfy { $0 == self.first }
    }
    
    func allUnequal() -> Bool {
        Set(self).count == self.count
    }
}
