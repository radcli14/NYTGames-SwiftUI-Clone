//
//  GamesPage.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/1/25.
//

import SwiftUI

struct GamesPage: View {
    let fontList = [
        "Times", "Georgia", "Palatino", "Charter", "American Typewriter Bold",
        "Baskerville Bold", "Bodoni 72 Oldstyle Book", "Charter Black", "Cochin Bold",
        "Didot Bold", "Hoefler Text Black", "Kailasa Bold", "Rockwell Bold",
        "Times New Roman Bold", "Optima Bold", "Rockwell Bold", "STIX Two Text Bold",
        "Trebuchet MS Bold", "Verdana Bold"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(fontList.sorted(), id: \.self) { font in
                        Text(font)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.top)
                        header(font: font)
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(.ultraThinMaterial)
            .toolbar {
                ToolbarItem(placement: .principal, content: { header(topPadding: 12) })
                ToolbarItem(placement: .navigationBarTrailing, content: settingsButton)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.background)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        }
    }
    
    // MARK: - Toolbar
    
    func header(font: String = "CheltenhamStd-Bold", topPadding: CGFloat = 0) -> some View {
        HStack(spacing: 4) {
            Image(.dc)
                .resizable()
                .frame(width: Constants.headerFontSize, height: Constants.headerFontSize)
            Rectangle()
                .frame(width: 0.5, height: 28)
            Text("Games")
                .padding(.top, topPadding)
                .fontWeight(.black)
        }
        .font(.custom(font, size: Constants.headerFontSize, relativeTo: .title))
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
