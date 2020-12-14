//
//  RickyAndMortyAPIRoute.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 13/12/20.
//

import Foundation

extension RickyAndMortyAPIClient {
    
    func urlPath(for apiRoute: APIRoute) throws -> String {
        let path: String
        
        switch apiRoute {
        case .getAllCharacters:
            path = "character"
        case .getSingleCharacter(let id):
            path = "character/\(id)"
        case .getMultipleCharacters(let ids):
            path = "character/\(multipleIds(ids))"
        case .filterCharacters(let queryItems):
            path = "character/\(getQueryString(queryItems))"
        case .getAllLocations:
            path = "location"
        case .getSingleLocation(let id):
            path = "location/\(id)"
        case .getMultipleLocations(let ids):
            path = "location/\(multipleIds(ids))"
        case .filterLocations(let queryItems):
            path = "location/\(getQueryString(queryItems))"
        case .getAllEpisodes:
            path = "episode"
        case .getSingleEpisode(let id):
            path = "episode/\(id)"
        case .getMultipleEpisodes(let ids):
            path = "episode/\(multipleIds(ids))"
        case .filterEpisodes(let queryItems):
            path = "episode/\(getQueryString(queryItems))"
        }
        
        return path
        
    }
    
    private func multipleIds(_ ids: [Int]) -> String {
        var idString = ""
        for id in ids {
            if id != ids[0] {
                idString += ",\(id)"
            } else {
                idString += "\(id)"
            }
        }
        return idString
    }
    
    private func getQueryString(_ queryItems: [URLQueryItem]) -> String {
        var urlComponents = URLComponents(string: "")
        urlComponents?.queryItems = queryItems
        return urlComponents?.url?.absoluteString ?? ""
    }
    
}
