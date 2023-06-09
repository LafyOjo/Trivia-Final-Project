//
//  GameDataModel.swift
//  Trivia
//
//  Created by Hamzah Azam on 19/05/2023.
//

import Foundation

// MARK: - GameDataModel
struct GameDataModel: Decodable {
    let responseCode: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

// MARK: - Result
struct Result: Decodable {
    let category: Category
    let type: TypeEnum
    let difficulty: Difficulty
    let question, correctAnswer: String
    let incorrectAnswers: [String]
    
    var formattedQuestion: AttributedString{
        do{
            return try AttributedString(markdown: question)
        } catch{
            print("Error setting FormattedQuestion: \(error)")
            return ""
        }
    }
    
   
    
    var answers: [AnswerModel]{
        do{
            let correctAnswer = [AnswerModel(answer: try AttributedString (markdown: correctAnswer), isCorrect: true)]
            let incorrectAnswers = try incorrectAnswers.map { answer in
                AnswerModel(answer: try AttributedString(markdown: answer), isCorrect: false)
            }
            let allAnswers = correctAnswer + incorrectAnswers
            return allAnswers.shuffled()
        }catch {
            print("Error setting answer: \(error)")
            return []
        }
    }
    
   

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Category: String, Codable {
    case generalKnowledge = "General Knowledge"
}

enum Difficulty: String, Codable {
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case multiple = "multiple"
}

extension Result:Identifiable{
    var id: UUID{UUID()}
}
