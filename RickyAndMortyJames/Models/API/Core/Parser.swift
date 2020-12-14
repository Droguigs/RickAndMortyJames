//
//  Parser.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import UIKit

public enum Parser {
    static func parse<T: Decodable>(dataType: T.Type = T.self, from data: Data) throws -> T {
        return try JSONDecoder().decode(dataType, from: data)
    }
    
    static func download(data: Data, fileName: String) -> URL? {
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        do {
            try data.write(to: fileURL, options: .atomic)
            return fileURL
        } catch {
            print(error)
        }
        
        return nil
    }
    
    static func parse<T: Decodable>(dataType: T.Type = T.self,
                                    from data: Data,
                                    callback: (Result<T>) -> Void) {
        do {
            let object = try parse(dataType: dataType, from: data)
            callback(.success(object))
        } catch {
            #if DEBUG
            print("Error decoding model: \(error)")
            if let str = String(data: data, encoding: .utf8) {
                print("Data: \(str)")
            }
            #endif
            
            callback(.failure(error))
        }
    }
}

