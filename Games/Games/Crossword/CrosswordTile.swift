//
//  CrosswordTile.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct CrosswordTile: View {
    var body: some View {
        GameTileView(
            title: "The Crossword",
            caption: "Subscribe to unlock daily puzzles and the archive.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .crossWordBlue,
            icon: CrosswordIcon.init
        )
    }
}

#Preview {
    CrosswordTile()
}
