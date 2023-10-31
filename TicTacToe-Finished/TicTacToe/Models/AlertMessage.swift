//
//  AlertMessage.swift
//  TicTacToe
//
//  Created by Coleton Gorecke on 10/17/23.
//

import Foundation

struct AlertMessage {
    let title = "Game Over!"
    var message: String
    
    init(message: String = "") {
        self.message = message
    }
}
