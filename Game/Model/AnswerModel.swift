//
//  AnswerModel.swift
//  Trivia
//
//  Created by Hamzah Azam on 24/05/2023.
//

import Foundation

struct AnswerModel: Identifiable{
    var id = UUID()
    var answer: AttributedString 
    var isCorrect: Bool
}
