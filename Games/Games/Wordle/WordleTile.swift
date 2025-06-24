//
//  WordleTile.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct WordleTile: View {
    var body: some View {
        GameTileView(
            title: "Wordle",
            caption: "Guess your way to the correct word.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .wordleGray,
            icon: WordleIcon.init
        )
    }
}

#Preview {
    WordleTile()
}
