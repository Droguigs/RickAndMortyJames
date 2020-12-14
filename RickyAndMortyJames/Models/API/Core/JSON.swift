//
//  JSON.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation

public enum JSON: Equatable {
    
    case dictionary([String: JSON])
    case array([JSON])
    case string(String)
    case number(Double)
    case bool(Bool)
    case `nil`
    
    public subscript(key: String) -> JSON? {
        switch self {
        case .dictionary(let dict):
            return dict[key]
        default:
            return nil
        }
    }
    
    public var stringValue: String? {
        switch self {
        case .string(let string):
            return string
        default:
            return nil
        }
    }
    
    public var asObject: Any {
        switch self {
        case .dictionary(let dict):
            return dict.mapValues { $0.asObject }
        case .array(let values):
            return values.map { $0.asObject }
        case .bool(let bool):
            if bool {
                return kCFBooleanTrue ?? true
            } else {
                return kCFBooleanFalse ?? false
            }
        case .number(let number):
            return NSNumber(value: number)
        case .string(let string):
            return string
        case .nil:
            return NSNull()
        }
    }
    
    public func toData(options: JSONSerialization.WritingOptions = []) throws -> Data {
        return try JSONSerialization.data(withJSONObject: self.asObject, options: options)
    }
    
}

extension JSON {
    
    public typealias ValueMapper = (_ key: String, _ value: JSON) throws -> JSON
    
    public func mapDictionaryValuesRecursive(with valueMapper: ValueMapper) rethrows -> JSON {
        
        switch self {
        case .dictionary(var dict):
            for(key, value) in dict {
                let newValue = try value.mapDictionaryValuesRecursive(with: valueMapper)
                
                dict[key] = try valueMapper(key, newValue)
            }
            return .dictionary(dict)
            
        case .array(let array):
            return try .array(array.map { try $0.mapDictionaryValuesRecursive(with: valueMapper) })
        default:
            return self
        }
    }
    
    public static func toJSON(_ value: Any) throws -> JSON {
        
        switch value {
        case let dictionary as NSDictionary:
            var json: [String: JSON] = [:]
            
            for(key, value) in dictionary {
                guard let key = key as? String else {
                    throw Error.invalidJson
                }
                let jsonValue = try toJSON(value)
                json[key] = jsonValue
            }
            
            return JSON.dictionary(json)
            
        case let array as [Any]:
            return try JSON.array(array.map(toJSON))
        case let boolean as NSNumber where CFGetTypeID(boolean as CFTypeRef) == CFBooleanGetTypeID():
            return JSON.bool((boolean as CFBoolean) == kCFBooleanTrue)
        case let number as Int:
            return JSON.number(Double(number))
        case let number as UInt:
            return JSON.number(Double(number))
        case let number as Float:
            return JSON.number(Double(number))
        case let number as Double:
            return JSON.number(Double(number))
        case let string as String:
            return JSON.string(string)
        case let bool as Bool:
            return JSON.bool(bool)
        case let value as Any? where value == nil:
            return JSON.nil
        case is NSNull:
            return JSON.nil
        default:
            throw Error.invalidJson
        }
    }
    
    public enum Error: Swift.Error {
        case invalidJson
    }
}

extension JSON: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .number(Double(value))
    }
}

extension JSON: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Float) {
        self = .number(Double(value))
    }
}

extension JSON: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension JSON: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}

extension JSON: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: JSON...) {
        self = .array(elements)
    }
}

extension JSON: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, JSON)...) {
        self = .dictionary(Dictionary(elements, uniquingKeysWith: { $1 } ))
    }
}
