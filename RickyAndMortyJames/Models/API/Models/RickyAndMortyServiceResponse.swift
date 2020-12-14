//
//  RickyAndMortyServiceResponse.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 09/12/20.
//

import Foundation

public struct RickyAndMortyCharacterServiceResponse: Codable {
    
    let info: Info
    let results: [Character]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        info = try container.decode(Info.self, forKey: .info)
        results = try container.decode([Character].self, forKey: .results)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(results, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
        
    }
    
}

public struct RickyAndMortyLocationServiceResponse: Codable {
    
    let info: Info
    let results: [LocationResult]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        info = try container.decode(Info.self, forKey: .info)
        results = try container.decode([LocationResult].self, forKey: .results)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(results, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
        
    }
    
}

public struct RickyAndMortyEpisodeServiceResponse: Codable {
    
    let info: Info
    let results: [Episode]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        info = try container.decode(Info.self, forKey: .info)
        results = try container.decode([Episode].self, forKey: .results)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(results, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
        
    }
    
}

struct Info: Codable {
    
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try container.decode(Int.self, forKey: .count)
        pages = try container.decode(Int.self, forKey: .pages)
        next = try container.decode(String?.self, forKey: .next)
        prev = try container.decode(String?.self, forKey: .prev)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
        try container.encode(pages, forKey: .pages)
        try container.encode(next, forKey: .next)
        try container.encode(prev, forKey: .prev)
    }
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}

struct Character: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decode(String.self, forKey: .status)
        species = try container.decode(String.self, forKey: .species)
        type = try container.decode(String.self, forKey: .type)
        gender = try container.decode(String.self, forKey: .gender)
        origin = try container.decode(Location.self, forKey: .origin)
        location = try container.decode(Location.self, forKey: .location)
        image = try container.decode(String.self, forKey: .image)
        episode = try container.decode([String].self, forKey: .episode)
        url = try container.decode(String.self, forKey: .url)
        created = try container.decode(String.self, forKey: .created)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(status, forKey: .status)
        try container.encode(species, forKey: .species)
        try container.encode(type, forKey: .type)
        try container.encode(gender, forKey: .gender)
        try container.encode(origin, forKey: .origin)
        try container.encode(location, forKey: .location)
        try container.encode(image, forKey: .image)
        try container.encode(episode, forKey: .episode)
        try container.encode(url, forKey: .url)
        try container.encode(created, forKey: .created)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
}

struct Location: Codable {
    
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

struct LocationResult: Codable {
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dimension
        case residents
        case url
        case created
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        dimension = try container.decode(String.self, forKey: .dimension)
        residents = try container.decode([String].self, forKey: .residents)
        url = try container.decode(String.self, forKey: .url)
        created = try container.decode(String.self, forKey: .created)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(dimension, forKey: .dimension)
        try container.encode(residents, forKey: .residents)
        try container.encode(url, forKey: .url)
        try container.encode(created, forKey: .created)
    }
    
}

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        airDate = try container.decode(String.self, forKey: .airDate)
        episode = try container.decode(String.self, forKey: .episode)
        characters = try container.decode([String].self, forKey: .characters)
        url = try container.decode(String.self, forKey: .url)
        created = try container.decode(String.self, forKey: .created)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(airDate, forKey: .airDate)
        try container.encode(episode, forKey: .episode)
        try container.encode(characters, forKey: .characters)
        try container.encode(url, forKey: .url)
        try container.encode(created, forKey: .created)
    }
}
