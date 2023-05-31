//
//  NetworkableProtocol.swift
//  Trivia
//
//  Created by Hamzah Azam on 26/05/2023.
//

import Foundation
protocol NetworkableProtocol{
    func getDataFromAPI(url:URL) async throws -> Data
}
