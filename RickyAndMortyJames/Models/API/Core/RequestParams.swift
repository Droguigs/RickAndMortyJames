//
//  RequestParams.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation
import UIKit

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case patch = "PATCH"
}

public enum RequestBody: Equatable {
    case json(JSON)
    
    var jsonBody: JSON? {
        switch self {
        case .json(let json):
            return json
        }
    }
    
    func toData() throws -> Data {
        switch self {
        case .json(let json):
            return try json.toData()
        }
    }
}

public struct RequestParams: Equatable {
    var route: APIRoute
    var method: RequestMethod
    var header: [String: String]
    var body: RequestBody?
    
    init<E: Encodable>(route: APIRoute,
                       method: RequestMethod = .get,
                       jsonEncodable: E,
                       header: [String: String] = [:]) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(jsonEncodable)
        let json = try JSON.toJSON(JSONSerialization.jsonObject(with: data, options: []))
        
        self.init(route: route, method: method, body: .json(json), header: header)
    }
    
    init(route: APIRoute,
         method: RequestMethod = .get,
         body: RequestBody? = nil,
         header: [String: String] = [:]) {
        
        self.route = route
        self.method = method
        self.body = body
        self.header = header
        
        self.header.merge(RequestParams.defaultHeaders(), uniquingKeysWith: { $1 } )
    }
    
    public static func defaultHeaders() -> [String: String] {
        let headers: [String: String] = [:]
        
        return headers
    }
    
    
}
