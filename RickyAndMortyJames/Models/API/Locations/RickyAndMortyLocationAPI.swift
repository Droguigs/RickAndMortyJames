//
//  RickyAndMortyServiceAPI.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import Foundation

public class RickyAndMortyLocationAPI: RickyAndMortyLocationAPIProtocol {
    
    private typealias ResultType = Result<RickyAndMortyLocationServiceResponse>
    
    var api: APIClient
    
    public init(api: APIClient = RickyAndMortyAPIClient.sharedClient) {
        self.api = api
    }
    
    public func getAllLocations(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func getSingleLocation(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func getMultipleLocations(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func filterLocations(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
}
