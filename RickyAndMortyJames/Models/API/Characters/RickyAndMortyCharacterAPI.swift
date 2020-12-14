//
//  RickyAndMortyServiceAPI.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation

public class RickyAndMortyCharacterAPI: RickyAndMortyCharacterAPIProtocol {
    
    
    private typealias ResultType = Result<RickyAndMortyCharacterServiceResponse>
    
    var api: APIClient
    
    public init(api: APIClient = RickyAndMortyAPIClient.sharedClient) {
        self.api = api
    }
    
    public func getAllCharacters(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func getSingleCharacter(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func getMultipleCharacters(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func filterCharacters(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
}
