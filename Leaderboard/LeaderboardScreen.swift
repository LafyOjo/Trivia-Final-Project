//
//  LeaderboardScreen.swift
//  Trivia
//
//  Created by Hamzah Azam on 31/05/2023.
//

import SwiftUI

struct LeaderboardScreen: View {
    var highScore = UserDefaults.standard.string(forKey: "com.ITC.Trivia.highScore")

    var body: some View {
        VStack{
            Text(highScore ?? "default value")
            
            Button("High Score"){
                UserDefaults.standard.set("SwiftUI", forKey: "com.ITC.iOSOfflineStorage.name")
                
//                let highScore = Score(highScore: <#T##String#>)
                if let encodedData = try? JSONEncoder().encode(highScore){
                    UserDefaults.standard.set(encodedData, forKey: "com.ITC.iOSOfflineStorage.PikachuObj")
                }
                
            }
        }
    }
}

struct HighScore_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardScreen()
    }
}

struct Score : Codable{
//    var id : UUID
    let highScore : String
}
