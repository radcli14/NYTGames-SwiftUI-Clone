//
//  ConnectionsIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct ConnectionsIcon: View {
    private let lineWidth: CGFloat = 4
    
    var body: some View {
        VStack(spacing: lineWidth) {
            tileRow(whiteTileIndex: 2)
            tileRow(whiteTileIndex: 3)
            tileRow(whiteTileIndex: 1)
            tileRow(whiteTileIndex: 0)
        }
        .background(.black)
        .padding(.horizontal, 0.5 * lineWidth)
        .padding(.vertical, lineWidth)
        .clipShape(.rect(cornerRadius: 2 * lineWidth))
        .overlay {
            RoundedRectangle(cornerRadius: 2 * lineWidth)
                .stroke(lineWidth: 2 * lineWidth)
        }
    }
    
    func tileRow(whiteTileIndex: Int) -> some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .stroke(.black, lineWidth: lineWidth)
                    .fill(.connectionsViolet)
                whiteTile(at: whiteTileIndex, in: geometry)
            }
        }
    }
    
    func whiteTile(at index: Int, in geometry: GeometryProxy) -> some View {
        Rectangle()
            .stroke(.black, lineWidth: 2 * lineWidth)
            .fill(.white)
            .frame(width: geometry.size.width / 4.75)
            .offset(x: 0.25 * (Double(index) - 1.5) * geometry.size.width)
    }
}

#Preview {
    GameIconPreview(icon: ConnectionsIcon.init)
}
