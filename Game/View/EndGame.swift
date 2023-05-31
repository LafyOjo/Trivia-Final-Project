//
//  EndGame.swift
//  Trivia
//
//  Created by Hamzah Azam on 26/05/2023.
//

import SwiftUI

struct EndGame: View {
    @StateObject var gameViewModel = GameScreenViewModel(manager: NetworkManager())
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
//        if gameViewModel.reachedEnd == true {
            VStack(spacing: 20) {
                Text("Congratulations, you completed the game!🥳")
                
                Text("You scored \(gameViewModel.score) out of \(gameViewModel.length)")
                
                Button {
                    coordinator.goToGameScreen()
                } label: {
                    PrimaryButton(text: "Play again")
                }

                
            }.foregroundColor(Color("AccentColor")).padding().frame(maxWidth: .infinity,maxHeight: .infinity).font(.title).fontWeight(.heavy)
                .background(Color.blue.opacity(0.3))
//        }else{
//            HomeScreen()
//        }
        
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame()
    }
}
