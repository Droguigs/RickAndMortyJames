//
//  Errors.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 13/12/20.
//

import Foundation

typealias ErrorMapped = [String: ResponseError]

struct Errors {
    static var codes: ErrorMapped = ["401": unauthorizedError()]
    
    static func getError(code: String) -> ResponseError {
        guard let responseError = self.codes[code] else {
            return self.genericError()
        }
        
        return responseError
    }
    
    static func requestError() -> ResponseError {
        return ResponseError(description: "Bad Request",
                             code: "400")
    }
    
    static func unauthorizedError() -> ResponseError {
        return ResponseError(description: "Unauthorized",
                             code: "401")
    }
    
    static func requestTimeoutError() -> ResponseError {
        return ResponseError(description: "Request Timeout",
                             code: "408")
    }
    
    static func CancellationError() -> ResponseError {
        return ResponseError(description: "Client Closed REquest",
                             code: "499")
    }
    
    static func parseError() -> ResponseError {
        return ResponseError(description: "Could not parse the Object",
                             code: "500")
    }
    
    static func genericError() -> ResponseError {
        return ResponseError(description: "Internal Server Error",
                             code: "500")
    }
    
    static func internetConnectionError() -> ResponseError {
        return ResponseError(description: "Bad Gateway",
                             code: "502")
    }
    
    
}
