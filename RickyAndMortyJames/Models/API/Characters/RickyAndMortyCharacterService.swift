//
//  RickyAndMortyService.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 13/12/20.
//

import Foundation

public class RickAndMortyCharacterService: RickyAndMortyCharacterServiceProtocol {
    
    let api: RickyAndMortyCharacterAPIProtocol
    
    public init(api: RickyAndMortyCharacterAPIProtocol = RickyAndMortyCharacterAPI()) {
        self.api = api
    }
    
    public func getAllCharacters(_ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getAllCharacters
        let request = RequestParams(route: route, method: .get)
        api.getAllCharacters(request, callback)
    }
    
    public func getSingleCharacter(id: Int,
                                   _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getSingleCharacter(id)
        let request = RequestParams(route: route, method: .get)
        api.getAllCharacters(request, callback)
    }
    
    public func getMultipleCharacters(ids: [Int],
                                      _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.getMultipleCharacters(ids)
        let request = RequestParams(route: route, method: .get)
        api.getAllCharacters(request, callback)
    }
    
    public func filterCharacters(queryItems: [URLQueryItem],
                                 _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>)-> Void) {
        let route: APIRoute = APIRoute.filterCharacters(queryItems)
        let request = RequestParams(route: route, method: .get)
        api.getAllCharacters(request, callback)
    }
    
}
