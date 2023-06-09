//
//  GameScreenViewModel.swift
//  Trivia
//
//  Created by Hamzah Azam on 19/05/2023.
//

import Foundation
import SwiftUI

@MainActor
class GameScreenViewModel : ObservableObject{
    
    var coordinator: Coordinator?
    @Published var gameScreenList = [Result]()
    @Published var networkError: NetworkError?
    
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [AnswerModel] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    var anyManager: NetworkableProtocol
    
    init(manager:NetworkableProtocol){
        self.anyManager = manager
    }
    
    func getGameQuestions(withUrlString urlString: String) async{
        
        guard let url = URL(string: urlString) else {
            networkError = NetworkError.invalidUrlError
            return
        }
        do {
            let data = try await self.anyManager.getDataFromAPI(url: url)
            let gameData = try JSONDecoder().decode(GameDataModel.self, from: data)
            let gameDataQuestions = gameData.results.map { game in
                Result(category: game.category, type: game.type, difficulty: game.difficulty, question: game.question, correctAnswer: game.correctAnswer, incorrectAnswers: game.incorrectAnswers)
                
            }
                            self.index = 0
                            self.score = 0
                            self.progress = 0.00
            //                self.reachedEnd = false
            //
            self.gameScreenList = gameDataQuestions
            
            self.length = self.gameScreenList.count
            self.setQuestion()
            
            
            
            
        }catch let error{
            switch error{
            case is DecodingError:
                networkError = .parsingError
            case is NetworkError:
                networkError = .dataNotFoundError
            case is URLError:
                networkError = .invalidUrlError
            default:
                networkError = .dataNotFoundError
            }
            print("DEBUG: ",error.localizedDescription)
        }
    }
    
    func goToNextQuestion(){
        if index + 1 < length{
            index += 1
            setQuestion()
        } else{
            reachedEnd = true
            coordinator?.goToEndGameScreen()
        }
    }
    
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentTrivia = gameScreenList[index]
            question = currentTrivia.formattedQuestion
            answerChoices = currentTrivia.answers
            
        }
    }
    
    func selectAnswer(answer: AnswerModel){
        if answerSelected == false{
            answerSelected = true
        }
        if answer.isCorrect == true {
            score = score + 1
            print(score)
        }
    }
}
