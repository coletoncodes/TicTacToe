//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by Coleton Gorecke on 10/16/23.
//

import Foundation

@MainActor
final class TicTacToeGame: ObservableObject {
    @Published var currentPlayer = Player.player1
    @Published var board: [Player?] = Array(repeating: nil, count: 9)
    @Published var isShowingWinnerAlert = false
    @Published var alertMessage = AlertMessage()
    
    private let availablePlayers: [Player] = Player.availablePlayers
    
    // MARK: - Computed Property
    var nextPlayer: Player {
        if currentPlayer == Player.player1 {
            return Player.player2
        } else {
            return Player.player1
        }
    }
    
    // MARK: - Interface
    func restart() {
        board = Array(repeating: nil, count: 9)
        currentPlayer = Player.player1
    }
    
    func makeMove(at index: Int) {
        if board[index] == nil {
            board[index] = currentPlayer
            currentPlayer = nextPlayer
        }
        checkForWinner()
    }
    
    func checkForWinner() {
        // Define winning patterns as sets of board indices
        let winningPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],  // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8],  // Columns
            [0, 4, 8], [2, 4, 6]              // Diagonals
        ]
        
        // Check each winning pattern
        for pattern in winningPatterns {
            /// Map players to the board pattern
            let cells = pattern.map { board[$0] }
            if cells == [.player1, .player1, .player1] {
                showWinnerAlert(message: "Player 1 Wins!")
                return
            } else if cells == [.player2, .player2, .player2] {
                showWinnerAlert(message: "Player 2 Wins!")
                return
            }
        }
        
        // Check if the game is a draw (all cells filled)
        if board.allSatisfy({ $0 != nil }) {
            showWinnerAlert(message: "It's a Draw!")
        }
    }
    
    func showWinnerAlert(message: String) {
        alertMessage.message = message
        isShowingWinnerAlert = true
    }
}
