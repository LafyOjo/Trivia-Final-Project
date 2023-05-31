//
//  NetworkManager.swift
//  Trivia
//
//  Created by Hamzah Azam on 26/05/2023.
//
import Foundation


class NetworkManager: NetworkableProtocol {
    
    
    func getDataFromAPI(url: URL) async throws -> Data {
        do{
            let (data,response) = try await URLSession.shared.data(from: url)
            print("Response: ",response)
            return data
        }catch {
            throw NetworkError.dataNotFoundError
        }
    }
    
    
}
