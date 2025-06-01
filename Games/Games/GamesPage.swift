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
            ScrollView {
                VStack {
                    /* Games content will go here */
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal, content: header)
                ToolbarItem(placement: .navigationBarTrailing, content: settingsButton)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.background)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        }
    }
    
    // MARK: - Toolbar
    
    func header() -> some View {
        HStack(spacing: 0) {
            Image(.dc)
                .resizable()
                .frame(width: Constants.headerFontSize, height: Constants.headerFontSize)
            Rectangle()
                .frame(width: 1, height: 24)
                .padding(.horizontal, 2)
            Text("Games")
        }
        .font(.custom("Times", size: Constants.headerFontSize, relativeTo: .title))
        .fontWeight(.black)
    }
    
    func settingsButton() -> some View {
        Button("Settings", systemImage: "gearshape.fill") { }
            .tint(.primary)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let headerFontSize: CGFloat = 34
    }
}

#Preview {
    GamesPage()
}
