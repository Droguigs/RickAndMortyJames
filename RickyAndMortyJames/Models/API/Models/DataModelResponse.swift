//
//  DataModelResponse.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 13/12/20.
//

import Foundation

public struct DataModelResponse<T: Codable>: Codable {
    public var data: T
}
