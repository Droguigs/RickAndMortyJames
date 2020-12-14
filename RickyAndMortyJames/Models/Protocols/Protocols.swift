//
//  Protocols.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 08/12/20.
//

import Foundation

public protocol APIClient {
    func request(params: RequestParams, callback: @escaping (Result<APIResponse>) -> Void)
    func requestDecodable<T: Decodable>(params: RequestParams, callback: @escaping (Result<T>) -> Void)
}

public extension APIClient {
    func requestDecodable<T: Decodable>(params: RequestParams, callback: @escaping (Result<T>) -> Void) {
        request(params: params) { resp in
            switch resp {
            case.success(let response):
                Parser.parse(from: response.data, callback: callback)
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}

public protocol RickyAndMortyCharacterServiceProtocol {
    func getAllCharacters(_ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getSingleCharacter(id: Int,
                            _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getMultipleCharacters(ids: [Int],
                               _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func filterCharacters(queryItems: [URLQueryItem],
                          _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
}

public protocol RickyAndMortyLocationServiceProtocol {
    func getAllLocations(_ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getSingleLocation(id: Int,
                           _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getMultipleLocations(ids: [Int],
                              _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func filterLocations(queryItems: [URLQueryItem],
                         _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
}

public protocol RickyAndMortyEpisodeServiceProtocol {
    func getAllEpisodes(_ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getSingleEpisode(id: Int,
                           _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getMultipleEpisodes(ids: [Int],
                             _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func filterEpisodes(queryItems: [URLQueryItem],
                        _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
}

public protocol RickyAndMortyCharacterAPIProtocol {
    func getAllCharacters(_ params: RequestParams,
                          _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getSingleCharacter(_ params: RequestParams,
                            _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getMultipleCharacters(_ params: RequestParams,
                               _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func filterCharacters(_ params: RequestParams,
                          _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
}

public protocol RickyAndMortyLocationAPIProtocol {
    func getAllLocations(_ params: RequestParams,
                         _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getSingleLocation(_ params: RequestParams,
                           _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getMultipleLocations(_ params: RequestParams,
                              _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func filterLocations(_ params: RequestParams,
                         _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
}

public protocol RickyAndMortyEpisodeAPIProtocol {
    func getAllEpisodes(_ params: RequestParams,
                        _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getSingleEpisode(_ params: RequestParams,
                           _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getMultipleEpisodes(_ params: RequestParams,
                             _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func filterEpisodes(_ params: RequestParams,
                        _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
}
