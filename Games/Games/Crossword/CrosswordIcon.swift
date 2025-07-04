//
//  CrosswordIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct CrosswordIcon: View {
    private let tileColors: [[Color]] = [
        [.white, .white, .black],
        [.white, .black, .white],
        [.black, .white, .white]
    ]

    var body: some View {
        GridIcon(tileColors: tileColors)
    }
}


#Preview {
    GameIconPreview(icon: CrosswordIcon.init)
}
