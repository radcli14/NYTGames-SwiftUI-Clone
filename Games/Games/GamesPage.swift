//
//  GamesPage.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/1/25.
//

import SwiftUI

struct GamesPage: View {
    var body: some View {
        NavigationStack {
            Text("Work in progress")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        header
                    }
                }
        }
    }
    
    var header: some View {
        Text("Games")
            .font(.custom("Georgia", size: 34, relativeTo: .largeTitle))
            .fontWeight(.bold)
    }
}

#Preview {
    GamesPage()
}
