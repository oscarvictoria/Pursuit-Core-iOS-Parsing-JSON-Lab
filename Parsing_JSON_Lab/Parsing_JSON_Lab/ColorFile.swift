//
//  ColorFile.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/26/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct ColorData: Codable {
    let name: String
    let rgb: [String : Double]
    let hexString: String
}

extension ColorData {
    static func getColors() -> [ColorData] {
        var color = [ColorData]()
        guard let fileURL = Bundle.main.url(forResource: "colors_api", withExtension: "json") else {
            fatalError("could not locate json file")
            
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let colorsData = try JSONDecoder().decode([ColorData].self, from: data)
            color = colorsData
        } catch {
            print("failed to load contents")
        }
        return color
    }
}

