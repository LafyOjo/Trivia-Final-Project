//
//  GameAnswer.swift
//  Trivia
//
//  Created by Hamzah Azam on 24/05/2023.
//

import SwiftUI

struct GameAnswer: View {
    var answerModel: AnswerModel
    @StateObject var gameViewModel = GameScreenViewModel(manager: NetworkManager())
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)

    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill").font(.caption)
            
            Text(answerModel.answer).bold()
            
            if isSelected{
                Spacer()
                
                Image(systemName: answerModel.isCorrect ? "checkmark.circle.fill" : "x.circle.fill").foregroundColor(answerModel.isCorrect ? green : red)
            }
            
        }
        .padding().frame(maxWidth: .infinity, alignment: .leading)

            .foregroundColor(gameViewModel.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
            .background(.white).cornerRadius(10)
            .shadow(color: isSelected ? (answerModel.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5).opacity(0.7)
            .onTapGesture {
                if !gameViewModel.answerSelected{
                    isSelected = true
                    gameViewModel.selectAnswer(answer: answerModel)
                }
            }
    }
}

struct GameAnswer_Previews: PreviewProvider {
    static var previews: some View {
        GameAnswer(answerModel: AnswerModel(answer: "Answer", isCorrect: true))
    }
}
