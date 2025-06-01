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
        HStack(spacing: 4) {
            Image(.dc)
                .resizable()
                .frame(width: Constants.headerFontSize, height: Constants.headerFontSize)
            Rectangle()
                .frame(width: 0.5, height: 28)
            Text("Games")
                .padding(.top, 12)
        }
        .font(.custom("CheltenhamStd-Bold", size: Constants.headerFontSize, relativeTo: .title))
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
