//
//  RickyAndMortyService.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import Foundation

public class RickAndMortyEpisodeService: RickyAndMortyEpisodeServiceProtocol {
    
    let api: RickyAndMortyEpisodeAPIProtocol
    
    public init(api: RickyAndMortyEpisodeAPIProtocol = RickyAndMortyEpisodeAPI()) {
        self.api = api
    }
    
    public func getAllEpisodes(_ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getAllEpisodes
        let request = RequestParams(route: route, method: .get)
        api.getAllEpisodes(request, callback)
    }
    
    public func getSingleEpisode(id: Int,
                                   _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getSingleEpisode(id)
        let request = RequestParams(route: route, method: .get)
        api.getSingleEpisode(request, callback)
    }
    
    public func getMultipleEpisodes(ids: [Int],
                                      _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getMultipleEpisodes(ids)
        let request = RequestParams(route: route, method: .get)
        api.getMultipleEpisodes(request, callback)
    }
    
    public func filterEpisodes(queryItems: [URLQueryItem],
                                 _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.filterEpisodes(queryItems)
        let request = RequestParams(route: route, method: .get)
        api.filterEpisodes(request, callback)
    }
    
}
