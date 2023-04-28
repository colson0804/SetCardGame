//
//  Diamond.swift
//  SetGame
//
//  Created by Craig Olson on 4/27/23.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let start = CGPoint(x: rect.midX, y: 0)
        p.move(to: start)
        p.addLine(to: CGPoint(x: 0, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        p.addLine(to: start)
        
        return p
    }
}
