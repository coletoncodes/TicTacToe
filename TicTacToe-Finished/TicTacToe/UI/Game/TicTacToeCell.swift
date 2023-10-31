//
//  TicTacToeCell.swift
//  TicTacToe
//
//  Created by Coleton Gorecke on 10/16/23.
//

import SwiftUI

struct TicTacToeCell: View {
    let player: Player?
    let action: (() -> Void)
    
    // MARK: - Body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.white)
                .frame(width: frameSize, height: frameSize)
            
            markerImage()
                .frame(width: frameSize, height: frameSize)
                .foregroundStyle(.black)
        }
        .padding()
        .onTapGesture {
            action()
        }
    }
    
    // MARK: - Constants
    private let cornerRadius: CGFloat = 10
    private let frameSize: CGFloat = 80
    
    // MARK: - ViewBuilders
    @ViewBuilder
    private func markerImage() -> some View {
        if let player {
            player.markerImage
                .resizable()
                .scaledToFill()
                .padding()
        } else {
            EmptyView()
        }
    }
}

#Preview {
    HStack {
        TicTacToeCell(player: nil, action: {})
        
        TicTacToeCell(player: Player.player1, action: {})
        
        TicTacToeCell(player: Player.player2, action: {})
        
    }
    .preferredColorScheme(.dark)
}
