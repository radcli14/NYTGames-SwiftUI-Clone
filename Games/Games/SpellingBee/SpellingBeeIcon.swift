//
//  SpellingBeeIcon.swift
//  Games
//
//  Created by Eliott Radcliffe on 6/24/25.
//

import SwiftUI

struct SpellingBeeIcon: View {
    private let lineWidth: CGFloat = 2
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                beeWings
                beeBody
                beeTail
                beeStripes
                beeFace(in: geometry)
            }
            .task {
                computeProperties(in: geometry)
            }
        }
    }
    
    var beeBody: some View {
        Capsule()
            .stroke(.black, lineWidth: 2 * lineWidth)
            .fill(.spellingbeeOrange)
            .frame(width: bodyWidth, height: bodyHeight)
            .offset(x: bodyOffsetX, y: bodyOffsetY)
    }
    
    var beeTail: some View {
        Path { path in
            path.move(to: .init(x: 0, y: bodyCenterY))
            path.addLine(to: .init(x: bodyLeftX, y: bodyCenterY))
        }
        .stroke(.black, lineWidth: lineWidth)
    }
    
    var beeStripes: some View {
        Path { path in
            path.move(to: .init(x: bodyCenterX, y: bodyBottomY))
            path.addLine(to: .init(x: bodyCenterX, y: bodyTopY))
            path.move(to: .init(x: bodyCenterX - offset, y: bodyBottomY))
            path.addLine(to: .init(x: bodyCenterX - offset, y: bodyTopY))
        }
        .stroke(.black, lineWidth: lineWidth)
    }
    
    @ViewBuilder
    var beeWings: some View {
        Path { path in
            path.move(to: .init(x: bodyCenterX, y: bodyTopY))
            path.addLine(to: .init(x: bodyCenterX, y: bodyTopY - offset))
            path.addArc(
                center: .init(x: bodyCenterX - offset, y: bodyTopY - offset),
                radius: offset,
                startAngle: .degrees(0),
                endAngle: .degrees(90),
                clockwise: true
            )
            path.addLine(to: .init(x: bodyCenterX, y: bodyTopY))
        }
        .stroke(.black, lineWidth: 2*lineWidth)
        .fill(.white)
        
        Path { path in
            path.move(to: .init(x: bodyCenterX, y: bodyTopY))
            path.addLine(to: .init(x: bodyCenterX, y: bodyTopY - offset))
            path.addArc(
                center: .init(x: bodyCenterX + offset, y: bodyTopY - offset),
                radius: offset,
                startAngle: .degrees(180),
                endAngle: .degrees(90),
                clockwise: false
            )
            path.addLine(to: .init(x: bodyCenterX, y: bodyTopY))
        }
        .stroke(.black, lineWidth: 2*lineWidth)
        .fill(.white)
    }
    
    @ViewBuilder
    func beeFace(in geometry: GeometryProxy) -> some View {
        let eyeX = offset + bodyOffsetX
        let eyeY = 0.5 * offset
        let eyeSize = 0.089 * geometry.size.width
        
        Circle()
            .fill(.black)
            .offset(x: eyeX, y: eyeY)
            .frame(width: eyeSize, height: eyeSize)
            
        let smileX = bodyWidth + bodyOffsetX
        let smileY = 0.67 * geometry.size.height

        Path { path in
            path.addArc(
                center: .init(x: smileX, y: smileY),
                radius: offset,
                startAngle: .degrees(70),
                endAngle: .degrees(140),
                clockwise: false)
        }
        .stroke(.black, lineWidth: lineWidth)
    }
    
    // MARK: - Shared Dimensions
    
    @State private var bodyWidth = 0.0
    @State private var bodyHeight = 0.0
    @State private var bodyOffsetX = 0.0
    @State private var bodyOffsetY = 0.0
    @State private var bodyLeftX = 0.0
    @State private var bodyCenterX = 0.0
    @State private var bodyCenterY = 0.0
    @State private var bodyTopY = 0.0
    @State private var bodyBottomY = 0.0
    @State private var offset = 0.0
    
    private func computeProperties(in geometry: GeometryProxy) {
        bodyWidth = 0.8 * geometry.size.width
        bodyHeight = 0.5 * geometry.size.height
        bodyOffsetX = 0.05 * geometry.size.width
        bodyOffsetY = 0.15 * geometry.size.height
        bodyLeftX = 0.5 * (geometry.size.width - bodyWidth) + bodyOffsetX
        bodyCenterX = 0.5 * geometry.size.width
        bodyCenterY = 0.5 * geometry.size.height + bodyOffsetY
        bodyTopY = 0.5 * (geometry.size.height - bodyHeight) + bodyOffsetY
        bodyBottomY = 0.5 * (geometry.size.height + bodyHeight) + bodyOffsetY
        offset = 0.15 * geometry.size.height
    }
}

#Preview {
    GameIconPreview(icon: SpellingBeeIcon.init)
        .background(.spellingbeeYellow)
}
