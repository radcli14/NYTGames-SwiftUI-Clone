//
//  WordleIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct WordleIcon: View {
    private let tileColors: [[Color]] = [
        [.white, .white, .white],
        [.white, .wordleYellow, .wordleGreen],
        [.wordleGreen, .wordleGreen, .wordleGreen]
    ]
    
    var body: some View {
        GridIcon(tileColors: tileColors)
    }
}

#Preview {
    GameIconPreview(icon: WordleIcon.init)
}
