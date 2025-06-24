//
//  ConnectionsIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct ConnectionsIcon: View {
    private let tileColors: [[Color]] = [
        [.connectionsViolet, .connectionsViolet, .white, .connectionsViolet],
        [.connectionsViolet, .connectionsViolet, .connectionsViolet, .white],
        [.connectionsViolet, .white, .connectionsViolet, .connectionsViolet],
        [.white, .connectionsViolet, .connectionsViolet, .connectionsViolet]
    ]
    
    var body: some View {
        GridIcon(tileColors: tileColors)
    }
}

#Preview {
    GameIconPreview(icon: ConnectionsIcon.init)
}
