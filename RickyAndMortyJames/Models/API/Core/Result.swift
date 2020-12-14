//
//  Result.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

public enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func map<Z>(_ transformer: (T) -> Z) -> Result<Z> {
        switch self {
        case .success(let value):
            return .success(transformer(value))
        case .failure(let error):
            return .failure(error)
        }
    }
}
