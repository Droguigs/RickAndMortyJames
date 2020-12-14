//
//  RickAndMortyAPIClient.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation

public class RickyAndMortyAPIClient: APIClient {
    
    public static var sharedClient: RickyAndMortyAPIClient {
        guard let baseUrl = APIRoute.baseURL, let apiHostName = baseUrl.host else {
            fatalError("Missing or malformed base URL")
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = RickyAndMortyAPIClient.ad
    }
    
    
    public func cancelRunningRequest(params: RequestParams?, callback: @escaping (Result<Error>) -> Void) { }
    
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
    
    func urlRequest(for requestParams: RequestParams, callback: @escaping (Result<URLRequest>) -> Void) {
        let path = try self.urlPath(for: requestParams.route)
                        
    }
    
}
