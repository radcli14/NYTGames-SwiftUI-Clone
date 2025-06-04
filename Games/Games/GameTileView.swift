//
//  GameTileView.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/4/25.
//

import SwiftUI

struct GameTileView<GameIcon: View>: View {
    let title: String
    let caption: String
    let date: Date
    let author: String
    let background: Color
    let icon: () -> GameIcon
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(title)
                    Text(caption)
                }
                icon()
                    .frame(width: iconSize, height: iconSize)
                    .clipShape(.rect(cornerRadius: iconCornerRadius))
            }
            Spacer()
            HStack {
                Text(date.formatted())
                Text(author)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: tileHeight)
        .background {
            RoundedRectangle(cornerRadius: tileCornerRadius).fill(background)
        }
    }
    
    // MARK: - Constants
    
    private let tileHeight: CGFloat = 164
    private let tileCornerRadius: CGFloat = 16
    private let iconSize: CGFloat = 72
    private let iconCornerRadius: CGFloat = 8
}

#Preview {
    GameTileView(
        title: "The Crossword",
        caption: "Subscribe to unlock daily puzzles and the archive.",
        date: .now,
        author: "Eliott Radcliffe",
        background: .blue,
        icon: { Color.black }
    )
    .padding()
}
