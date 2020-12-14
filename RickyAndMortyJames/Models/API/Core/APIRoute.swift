//
//  APIRoute.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation

public enum APIRoute: Hashable {
    case getAllCharacters
    case getSingleCharacter(Int)
    case getMultipleCharacters([Int])
    case filterCharacters([URLQueryItem])
    case getAllLocations
    case getSingleLocation(Int)
    case getMultipleLocations([Int])
    case filterLocations([URLQueryItem])
    case getAllEpisodes
    case getSingleEpisode(Int)
    case getMultipleEpisodes([Int])
    case filterEpisodes([URLQueryItem])
    static var baseURL: URL? {
        return URL(string: "https://rickandmortyapi.com/api/")
    }
}
