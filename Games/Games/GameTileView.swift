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
            }
            HStack {
                Text(date.formatted())
                Text(author)
            }
        }
        .background(background)
    }
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
}
