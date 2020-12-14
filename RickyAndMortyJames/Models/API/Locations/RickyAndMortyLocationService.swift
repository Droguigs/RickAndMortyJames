//
//  RickyAndMortyService.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import Foundation

public class RickAndMortyLocationService: RickyAndMortyLocationServiceProtocol {
    
    let api: RickyAndMortyLocationAPIProtocol
    
    public init(api: RickyAndMortyLocationAPIProtocol = RickyAndMortyLocationAPI()) {
        self.api = api
    }
    
    public func getAllLocations(_ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getAllLocations
        let request = RequestParams(route: route, method: .get)
        api.getAllLocations(request, callback)
    }
    
    public func getSingleLocation(id: Int,
                                   _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getSingleLocation(id)
        let request = RequestParams(route: route, method: .get)
        api.getSingleLocation(request, callback)
    }
    
    public func getMultipleLocations(ids: [Int],
                                      _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getMultipleLocations(ids)
        let request = RequestParams(route: route, method: .get)
        api.getMultipleLocations(request, callback)
    }
    
    public func filterLocations(queryItems: [URLQueryItem],
                                 _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.filterLocations(queryItems)
        let request = RequestParams(route: route, method: .get)
        api.filterLocations(request, callback)
    }
    
}
