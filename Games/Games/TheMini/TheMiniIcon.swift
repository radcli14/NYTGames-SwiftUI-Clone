//
//  TheMiniIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct TheMiniIcon: View {
    private let tileColors: [[Color]] = [
        [.black, .white],
        [.white, .white]
    ]
    
    var body: some View {
        GridIcon(tileColors: tileColors)
    }
}

#Preview {
    GameIconPreview(icon: TheMiniIcon.init)
}
