//
//  GridIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct GridIcon: View {
    let tileColors: [[Color]]
    var lineWidth: CGFloat = 4
    
    var body: some View {
        Grid(
            horizontalSpacing: lineWidth,
            verticalSpacing: lineWidth
        ) {
            ForEach(tileColors, id: \.self) { row in
                GridRow {
                    ForEach(row, id: \.self) { tileColor in
                        tileColor
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
}

#Preview {
    GameIconPreview {
        GridIcon(
            tileColors: [[.red, .white], [.white, .blue]]
        )
    }
}
