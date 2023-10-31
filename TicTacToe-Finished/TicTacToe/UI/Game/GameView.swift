//
//  GameView.swift
//  TicTacToe
//
//  Created by Coleton Gorecke on 10/16/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var game = TicTacToeGame()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            GameBoardView()
                .environmentObject(game)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(navTitleText)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Computed
    private var navTitleText: String {
        "\(game.currentPlayer.name)'s Turn"
    }
}

struct GameBoardView: View {
    @EnvironmentObject private var game: TicTacToeGame
    
    var body: some View {
        VStack {
            
            Spacer()
            
            LazyVGrid(columns: columns) {
                ForEach(0..<game.board.count, id: \.self) { index in
                    TicTacToeCell(player: game.board[index]) {  game.makeMove(at: index)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            Button(restartGameText) {
                game.restart()
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .alert(
            game.alertMessage.title,
            isPresented: $game.isShowingWinnerAlert,
            actions: {
                Button(restartGameText) {
                    game.restart()
                }
            }, message: {
                Text(game.alertMessage.message)
            })
    }
    
    // MARK: - Constants
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    private let restartGameText = "Restart Game"
}

#Preview {
    NavigationStack {
        GameView()
            .preferredColorScheme(.dark)
    }
}
