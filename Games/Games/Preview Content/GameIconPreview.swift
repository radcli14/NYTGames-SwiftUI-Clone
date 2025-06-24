//
//  GameIconPreview.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct GameIconPreview<GameIcon: View>: View {
    let icon: () -> GameIcon
    
    var body: some View {
        icon()
            .frame(width: 72, height: 72)
            .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    VStack {
        HStack {
            GameIconPreview(icon: CrosswordIcon.init)
            GameIconPreview(icon: SpellingBeeIcon.init)
            GameIconPreview(icon: ConnectionsIcon.init)
        }
        HStack {
            GameIconPreview(icon: WordleIcon.init)
            GameIconPreview(icon: TheMiniIcon.init)
        }
    }
}
