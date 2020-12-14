//
//  RickyAndMortyServiceAPI.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import Foundation

public class RickyAndMortyEpisodeAPI: RickyAndMortyEpisodeAPIProtocol {
    
    private typealias ResultType = Result<RickyAndMortyEpisodeServiceResponse>
    
    var api: APIClient
    
    public init(api: APIClient = RickyAndMortyAPIClient.sharedClient) {
        self.api = api
    }
    
    public func getAllEpisodes(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func getSingleEpisode(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func getMultipleEpisodes(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
    
    public func filterEpisodes(_ params: RequestParams, _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void) {
        api.requestDecodable(params: params) {(result: ResultType) in
            callback(result.map { $0 })
        }
    }
}
