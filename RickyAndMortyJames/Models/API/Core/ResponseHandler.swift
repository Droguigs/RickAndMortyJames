//
//  ResponseHandler.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 13/12/20.
//

import Alamofire

class ResponseHandler {
    func handleResponse(response: Alamofire.DataResponse<Data, AFError>,
                        callback: @escaping (Result<APIResponse>) -> Void ) {
        
        if let error = response.error {
            switch error._code {
            case NSURLErrorTimedOut:
                print(error.localizedDescription)
                callback(.failure(Errors.requestTimeoutError()))
                return
            case NSURLErrorCancelled:
                print(error.localizedDescription)
                callback(.failure(Errors.CancellationError()))
                return
            default:
                break
            }
        }
        
        guard let code = response.response?.statusCode else {
            callback(.failure(Errors.requestError()))
            return
        }
        
        let dataAsString =
            response.data.flatMap { String(data: $0, encoding: .utf8) }
            ?? "failed to convert to UTF8 String"
        
        print("DATA: \(dataAsString)")
        print("RESPONSE: \(String(describing: response.response))")
        
        let headers = response.response?.allHeaderFields as? [String: String] ?? ["": ""]
        
        switch code {
        case 200...299:
            switch (response.data, response.response) {
            case let (data?, httpResponse?):
                callback(.success(APIResponse(data: data, response: httpResponse, headers: headers)))
            default:
                callback(.failure(Errors.genericError()))
            }
            
        default:
            let decoder = JSONDecoder()
            
            if let data = response.data {
                
                do {
                    let apiError = try decoder.decode(APIError.self, from: data)
                    
                    callback(.failure(apiError.error))
                } catch {
                    callback(.failure(Errors.getError(code: "\(code)")))
                }
                
            } else {
                callback(.failure(Errors.getError(code: "\(code)")))
                
            }
        }
    }
}

extension ResponseHandler {
    func dataToDict(data: Data) -> [String: AnyObject]? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] ?? nil
            return json
        } catch {
            return nil
        }
    }
}
