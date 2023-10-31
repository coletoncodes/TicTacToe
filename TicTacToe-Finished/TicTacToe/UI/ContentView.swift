//
//  ContentView.swift
//  TicTacToe
//
//  Created by Coleton Gorecke on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Text(titleText)
                    .font(.title)
                
                Text(headlineText)
                    .font(.headline)
                    .bold()
                
                Spacer()
                
                NavigationLink(beginGameText) {
                    GameView()
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()

            }
            .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Constants
    private let titleText = "Welcome To"
    private let headlineText = "Tic-Tac-Toe"
    private let beginGameText = "Begin Game"
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
