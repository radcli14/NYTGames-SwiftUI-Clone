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
    let icon: () -> GameIcon
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GameTileView(title: "", caption: "", date: Date(), author: "", icon: { Text("") })
}
