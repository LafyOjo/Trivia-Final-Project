//
//  HomeScreen.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import SwiftUI
import UIKit

struct HomeScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    var gameScreenModel: GameScreenViewModel?
 
    var body: some View {
        ZStack{
//            Color.blue.opacity(0.3)
            Image("BG").resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("TRIVIA").font(.title).padding().foregroundColor(Color("AccentColor")).fontWeight(.heavy)
                
                Group{
                    Button {
                        coordinator.goToGameScreen()
                    } label: {
                        Text("Start Game")
                    }
                    Button {
                        coordinator.goToUIKitScreen()
                    } label: {
                        Text("How To Play")
                    }
                    Button {
                        
                    } label: {
                        Text("High Score")
                    }
                }.buttonStyle(.borderedProminent).cornerRadius(30)
                    .shadow(radius: 10)
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
