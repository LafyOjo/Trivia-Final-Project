//
//  FakeNetworkManager.swift
//  TriviaTests
//
//  Created by Hamzah Azam on 28/05/2023.
//

import Foundation

import Foundation
@testable import Trivia

class FakeNetworkManager: NetworkableProtocol {
    
    func getDataFromAPI(url: URL) async throws -> Data {
        let bundle = Bundle(for: FakeNetworkManager.self)
        
        guard let filePathUrl = bundle.url(forResource: url.absoluteString, withExtension: "json") else {
            throw NetworkError.invalidUrlError
        }
        
        do {
            // Raw data still
            let data = try Data(contentsOf: filePathUrl)
            return data
        }catch {
            throw NetworkError.dataNotFoundError
        }
    }
}
