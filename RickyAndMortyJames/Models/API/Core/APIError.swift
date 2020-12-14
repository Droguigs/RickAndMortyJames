//
//  APIError.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 13/12/20.
//

import Foundation

public struct APIError: Decodable, Error, Equatable {
    
    var error: ResponseError
    
    public enum CodingKeys: String, CodingKey {
        case error = "error"
    }

}

public struct ResponseError: Decodable, Error, Equatable {
    
    var description: String?
    var code: String?
    
    public enum CodingKeys: String, CodingKey {
        case description
        case code
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        if let stringCode = try? container.decode(String.self, forKey: .code) {
            code = stringCode
        } else if let intCode = try? container.decode(Int.self, forKey: .code) {
            code = "\(intCode)"
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON"))
        }
    }
    
    init(description: String, code: String) {
        self.description = description
        self.code = code
    }
}
