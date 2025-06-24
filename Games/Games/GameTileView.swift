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
    let background: Color
    let icon: () -> GameIcon
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.custom("CheltenhamStd-Bold", size: 22, relativeTo: .title2))
                    Text(caption)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .fixedSize(horizontal: false, vertical: true)
                Spacer()
                icon()
                    .frame(width: iconSize, height: iconSize)
                    .clipShape(.rect(cornerRadius: iconCornerRadius))
                    .padding(.leading, paddingWidth)
            }
            Spacer()
            HStack {
                Text(date.formatted(.dateTime.weekday(.wide).month(.abbreviated).day()))
                    .font(.subheadline)
                Spacer()
                ( Text("By ") + Text(author.uppercased()) )
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding(paddingWidth)
        .frame(width: tileWidth, height: tileHeight)
        .background {
            RoundedRectangle(cornerRadius: tileCornerRadius).fill(background)
        }
    }
    
    // MARK: - Constants
    
    private let paddingWidth: CGFloat = 24
    private let tileWidth: CGFloat = 340
    private let tileHeight: CGFloat = 170
    private let tileCornerRadius: CGFloat = 16
    private let iconSize: CGFloat = 64
    private let iconCornerRadius: CGFloat = 8
}

#Preview {
    GameTileView(
        title: "Test Tile",
        caption: "This is an example of a game tile like in NYT Games",
        date: .now,
        author: "Eliott Radcliffe",
        background: .tilesGreen,
        icon: { Color.secondary })
}
