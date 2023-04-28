//
//  Shape+Extensions.swift
//  SetGame
//
//  Created by Craig Olson on 4/28/23.
//

import SwiftUI

extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1, opacity: CGFloat = 1) -> some View {
        self.stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle).opacity(opacity))
    }
    
    func fill(with card: SetGame.Card) -> some View {
        let color = Color[card.color]
        return self.fill(card.pattern == .open ? .white : color, strokeBorder: color, lineWidth: 3, opacity: card.pattern == .striped ? 0.2 : 1)
    }
}
