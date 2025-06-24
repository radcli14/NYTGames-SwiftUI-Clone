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
            ForEach(tileColors.indices, id: \.self) { i in
                GridRow {
                    ForEach(tileColors[i].indices, id: \.self) { j in
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
}

#Preview {
    GameIconPreview {
        GridIcon(
            tileColors: [[.red, .white], [.white, .blue]]
        )
    }
}
