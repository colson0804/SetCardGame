//
//  Color+Extensions.swift
//  SetGame
//
//  Created by Craig Olson on 4/27/23.
//

import SwiftUI

extension Color {
    static subscript(setGameColor: SetGame.Card.Color) -> Color {
        switch setGameColor {
        case .green:
            return .green
        case .purple:
            return .purple
        case .red:
            return .red
        }
    }
}
