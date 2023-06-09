//
//  TriviaApp.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import SwiftUI

@main
struct TriviaApp: App {
    @StateObject private var gameViewModel = GameScreenViewModel(manager: NetworkManager())
    @StateObject private var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            MainScreen().environmentObject(gameViewModel)
                .environmentObject(coordinator)
        }
    }
}
