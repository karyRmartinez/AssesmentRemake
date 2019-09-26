//
//  ElementStruct.swift
//  assesmentRemake
//
//  Created by Kary Martinez on 9/22/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import Foundation

struct Element: Codable {
    let name: String
    let number: Int
    let symbol: String
    let boilingPoint: Double?
    let discoveredBy: String?
    let meltingPoint: Double?
    let atomicMass: Double
    
    var thumbnailImageURL: String { //Computed property
        switch number {
        case 1...9: return "http://www.theodoregray.com/periodictable/Tiles/00\(number)/s7.JPG"
            
        case 10...99: return "http://www.theodoregray.com/periodictable/Tiles/0\(number)/s7.JPG"
            
        case 100: return "http://www.theodoregray.com/periodictable/Tiles/\(number)/s7.JPG"
            
        default: return ""
        }
    }
    
    var largeImageURL: String {
        return "http://images-of-elements.com/\(name.lowercased()).jpg"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case symbol
        case number
        case atomicMass = "atomic_mass"
        case discoveredBy = "discovered_by"
        case boilingPoint = "boiling"
        case meltingPoint = "melt"
    }
    
    func getElements(from JsonData: Data) throws -> [Element]  {
        let response  = try JSONDecoder().decode([Element].self, from: JsonData)
        return response
    }
}
