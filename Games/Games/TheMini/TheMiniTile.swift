//
//  TheMiniTile.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct TheMiniTile: View {
    var body: some View {
        GameTileView(
            title: "The Mini",
            caption: "Solve the puzzle in seconds.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .miniBlue,
            icon: TheMiniIcon.init
        )
    }
}

#Preview {
    TheMiniTile()
}
