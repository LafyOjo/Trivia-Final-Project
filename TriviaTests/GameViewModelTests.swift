//
//  GameViewModelTests.swift
//  TriviaTests
//
//  Created by Hamzah Azam on 29/05/2023.
//

import XCTest
@testable import Trivia

final class GameViewModelTests: XCTestCase {

    override func setUpWithError() throws {
           // Put setup code here. This method is called before the invocation of each test method in the class.
       }

       override func tearDownWithError() throws {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }

       
       func testGetListOfQuestions_Positively()async throws {
           let gameViewModel = await GameScreenViewModel(manager: FakeNetworkManager())
           XCTAssertNotNil(gameViewModel)
           await gameViewModel.getGameQuestions(withUrlString: "TriviaTestFile")
         
           let triviaListCount = await gameViewModel.gameScreenList.count
           XCTAssertEqual(triviaListCount, 10)
           XCTAssertNotEqual(triviaListCount, 4)
           let error = await gameViewModel.networkError
           XCTAssertNil(error)
       }
       
       func testGetListOfQuestions_WithInvalidUrl()async throws {
           let gameViewModel = await GameScreenViewModel(manager: FakeNetworkManager())
           XCTAssertNotNil(gameViewModel)
           await gameViewModel.getGameQuestions(withUrlString: "")
           
           let triviaListCount = await gameViewModel.gameScreenList.count
           XCTAssertEqual(triviaListCount, 0)
           XCTAssertNotEqual(triviaListCount, 4)
           
           let error = await gameViewModel.networkError
           XCTAssertNotNil(error)
           XCTAssertEqual(error, NetworkError.invalidUrlError)
       }
       
       func testGetListOfQuestions_WithValidUrlButEmptyFile()async throws {
           let gameViewModel = await GameScreenViewModel(manager: FakeNetworkManager())
           XCTAssertNotNil(gameViewModel)
           await gameViewModel.getGameQuestions(withUrlString: "TriviaTestEmptyFile")
           let triviaListCount = await gameViewModel.gameScreenList.count
           XCTAssertEqual(triviaListCount, 0)
           XCTAssertNotEqual(triviaListCount, 4)
           
           let error = await gameViewModel.networkError
           XCTAssertEqual(error, NetworkError.parsingError)
       }
       
       func testGetListOfQuestions_ForActualData()async throws {
           let gameViewModel = await GameScreenViewModel(manager: FakeNetworkManager())
           await gameViewModel.getGameQuestions(withUrlString: "TriviaTestFile")
           let firstTriviaQuestion = await gameViewModel.gameScreenList[0]
           XCTAssertEqual(firstTriviaQuestion.correctAnswer, "Hearts")
           XCTAssertEqual(firstTriviaQuestion.question, "In a standard set of playing cards, which is the only king without a moustache?")
       }

       func testPerformanceExample() throws {
           // This is an example of a performance test case.
           self.measure {
               // Put the code you want to measure the time of here.
           }
       }

}
