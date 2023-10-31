//
//  Player.swift
//  TicTacToe
//
//  Created by Coleton Gorecke on 10/16/23.
//

import Foundation
import SwiftUI

struct Player: Equatable {
    let name: String
    let markerImage: Image
    
    init(
        name: String,
        markerImage: Image
    ) {
        self.name = name
        self.markerImage = markerImage
    }
    
    static let player1 = Player(name: "Player 1", markerImage: Image(systemName: "person.circle.fill"))
    static let player2 = Player(name: "Player 2", markerImage: Image(systemName: "person.circle"))
    
    static var availablePlayers: [Player] {
        [player1, player2]
    }
}
