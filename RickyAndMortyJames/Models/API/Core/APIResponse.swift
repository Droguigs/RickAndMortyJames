//
//  APIResponse.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation

public struct APIResponse {
    public var data: Data
    public var response: URLResponse
    public var headers: [String: String]
}
