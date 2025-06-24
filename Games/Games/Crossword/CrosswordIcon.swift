//
//  CrosswordIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct CrosswordIcon: View {
    var tileColors: [[Color]] = [
        [.white, .white, .black],
        [.white, .black, .white],
        [.black, .white, .white]
    ]
    
    var body: some View {
        Grid(
            horizontalSpacing: lineWidth,
            verticalSpacing: lineWidth
        ) {
            ForEach(0..<3) { i in
                GridRow {
                    ForEach(0..<3) { j in
                        tileColors[i][j]
                    }
                }
            }
        }
        .background(.black)
        .scaledToFill()
        .padding(lineWidth)
        .overlay {
            RoundedRectangle(cornerRadius: 2 * lineWidth)
                .stroke(lineWidth: 2 * lineWidth)
        }
    }
    
    private let lineWidth: CGFloat = 4
}


#Preview {
    GameIconPreview(icon: CrosswordIcon.init)
}
