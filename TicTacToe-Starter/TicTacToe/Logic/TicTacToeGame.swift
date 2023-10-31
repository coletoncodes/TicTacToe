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
        // Reset the board to `empty`
        // Reset the current player to the next player
    }
    
    func makeMove(at index: Int) {
        // Assign a player to the board at the given index
        // make the current player the next player
        // Check for winner each time a move is made
        checkForWinner()
    }
    
    /// The core logic for determing if there is a winner.
    /// Should be called after making a move
    func checkForWinner() {
        // Define winning patterns as sets of board indices
        // Consider rows, columns, and diagonals
        
        // Loop through the winning patterns
        // Check each pattern if all 3 cells equal player 1 or player 2
        // If win is found, display an alert
        
        // Note: Determining if the game is a "draw"
        // In the event of all of the values in the board being filled,
        // and no winning combination is found
        
        // Check if the game is a draw
        // (all cells filled with player values, but no winner exists.)
    }
    
    /// Displays an Alert Dialogue box on the view with the given message.
    /// - Parameter message: The message to display on the alert dialogue.
    func showWinnerAlert(message: String) {
        alertMessage.message = message
        isShowingWinnerAlert = true
    }
}
