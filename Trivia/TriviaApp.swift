//
//  TriviaApp.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import SwiftUI

@main
struct TriviaApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreen().environmentObject(Coordinator())
        }
    }
}
