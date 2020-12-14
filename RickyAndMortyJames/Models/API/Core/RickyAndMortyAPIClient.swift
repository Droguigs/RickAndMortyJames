//
//  RickAndMortyAPIClient.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation
import Alamofire

public class RickyAndMortyAPIClient: APIClient {
    
    public static let sharedClient: RickyAndMortyAPIClient = {
        guard let baseUrl = APIRoute.baseURL, let apiHostName = baseUrl.host else {
            fatalError("Missing or malformed base URL")
        }
        
        var serverUrl = "\(apiHostName)"
        if let port = baseUrl.port {
            serverUrl += ":\(port)"
        }
        
        let apiClient = RickyAndMortyAPIClient()
        return apiClient
    }()
}

extension RickyAndMortyAPIClient {
    
    public func requestDecodable<T>(params: RequestParams, callback: @escaping (Result<T>) -> Void) where T : Decodable {
        request(params: params) { resp in
            switch resp {
            case .success(let response):
                Parser.parse(from: response.data, callback: callback)
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func request(params: RequestParams, callback: @escaping (Result<APIResponse>) -> Void) {
        
    }
    
    func handleResponse(_ response: DataResponse<Data, Error>,
                        callback: @escaping (Result<APIResponse>) -> Void) {
        ResponseHandler().handleResponse(response: response, callback: callback)
    }
    
    func urlRequest(for requestParams: RequestParams,
                    callback: @escaping (Result<URLRequest>) -> Void) {
        
        do {
            //TODO :- Generic path
            let path = try self.urlPath(for: requestParams.route)
            guard let url = URL(string: path, relativeTo: APIRoute.baseURL) else {
                fatalError("Invalid URL was created: \(path)")
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = requestParams.method.rawValue
            request.allHTTPHeaderFields = requestParams.header
            
            callback(.success(request))
        } catch {
            callback(.failure(Errors.genericError()))
        }
        
    }
    
}

extension RickyAndMortyAPIClient {
    static func makeInvalidResponseError() -> Error {
        return APIClientError.invalidResponse
    }
    
    enum APIClientError: Swift.Error {
        case invalidResponse
    }
}
