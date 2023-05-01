//
//  Cardify.swift
//  SetGame
//
//  Created by Craig Olson on 5/1/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    private var isSelected: Bool
    
    init(isSelected: Bool) {
        self.isSelected = isSelected
    }
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: CardConstants.cornerRadius)
                    .fill(.white)
                RoundedRectangle(cornerRadius: CardConstants.cornerRadius)
                    .strokeBorder(isSelected ? .yellow : .red, lineWidth: CardConstants.lineWidth)
                
                content
//                VStack {
//                    ForEach(0..<card.numberOfShapes, id: \.self) { _ in
//                        switch card.shape {
//                        case .oval:
//                            RoundedRectangle(cornerRadius: 50)
//                                .fill(with: card)
//                        case .diamond:
//                            Diamond()
//                                .fill(with: card)
//                        case .squiggle:
//                            Rectangle()
//                                .fill(with: card)
//                        }
//                    }
//                }
                .padding(geometry.size.width * 0.2)
            }
        }
    }
    
    private struct CardConstants {
        static let cornerRadius: CGFloat = 10
        static let aspectRatio = 2/3
        static let lineWidth: CGFloat = 5
    }
}

extension View {
    func cardify(isSelected: Bool = false) -> some View {
        modifier(Cardify(isSelected: isSelected))
    }
}
