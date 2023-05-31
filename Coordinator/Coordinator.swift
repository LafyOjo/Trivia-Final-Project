//
//  Coordinator.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject{
    @Published var navigationPath = NavigationPath()
    
    func goToGameScreen(){
        navigationPath.append(MyScreen.GameScreen)
    }
    
    func goToUIKitScreen(){
        navigationPath.append(MyScreen.UIKitScreen)
    }
    
    func goToEndGameScreen(){
        navigationPath.append(MyScreen.EndGameScreen)
    }

    
    @ViewBuilder
    func goToScreen(screen: MyScreen) -> some View{
        switch screen{
        case .HomeScreen:
            HomeScreen()
        case .GameScreen:
            GameScreen()
        case .UIKitScreen:
            UIKitNavView()
        case .EndGameScreen:
            EndGame()
        }
    }
}

enum MyScreen{
    case HomeScreen
    case GameScreen
    case UIKitScreen
    case EndGameScreen
}
