//
//  SpellingBeeTile.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct SpellingBeeTile: View {
    var body: some View {
        GameTileView(
            title: "Spelling Bee",
            caption: "Make as many words as you can with 7 letters.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .spellingbeeYellow,
            icon: SpellingBeeIcon.init
        )
    }
}

#Preview {
    SpellingBeeTile()
}
