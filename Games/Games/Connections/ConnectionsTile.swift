//
//  ConnectionsTile.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct ConnectionsTile: View {
    var body: some View {
        GameTileView(
            title: "Connections",
            caption: "Group words that share a common thread.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .connectionsPurple,
            icon: ConnectionsIcon.init
        )
    }
}

#Preview {
    ConnectionsTile()
}
