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
                    .font(.headline)
                Spacer()
                ( Text("By ") + Text(author.uppercased()) )
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding(paddingWidth)
        .frame(maxWidth: .infinity, maxHeight: tileHeight)
        .background {
            RoundedRectangle(cornerRadius: tileCornerRadius).fill(background)
        }
    }
    
    // MARK: - Constants
    
    private let paddingWidth: CGFloat = 24
    private let tileHeight: CGFloat = 180
    private let tileCornerRadius: CGFloat = 16
    private let iconSize: CGFloat = 72
    private let iconCornerRadius: CGFloat = 8
}

extension GameTileView {
    
    // MARK: - Presets

    static var crossword: some View {
        GameTileView<Color>(
            title: "The Crossword",
            caption: "Subscribe to unlock daily puzzles and the archive.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .crossWordBlue,
            icon: { Color.black }
        )
    }
    
    static var spellingBee: some View {
        GameTileView<Color>(
            title: "Spelling Bee",
            caption: "Make as many words as you can with 7 letters.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .spellingbeeYellow,
            icon: { Color.spellingbeeOrange }
        )
    }
    
    static var wordle: some View {
        GameTileView<Color>(
            title: "Wordle",
            caption: "Guess your way to the correct word.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .wordleGray,
            icon: { Color.wordleGreen }
        )
    }
    
    static var connections: some View {
        GameTileView<Color>(
            title: "Connections",
            caption: "Group words that share a common thread.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .connectionsPurple,
            icon: { Color.connectionsViolet }
        )
    }
    
    static var theMini: some View {
        GameTileView<Color>(
            title: "The Mini",
            caption: "Solve the puzzle in seconds.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .miniBlue,
            icon: { Color.miniBlueVar }
        )
    }
}

#Preview {
    GameTileView<Color>.crossword.padding()
}
