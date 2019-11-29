//
//  RandomUseFile.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/26/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct RandomUserData: Codable {
    let results: [UserData]
}

struct UserData: Codable {
    let name: [String:String]
    let email: String
    let location: Location
    let phone: String
    let dob: DOB
}

struct Location: Codable {
    let city, country, state: String
}

struct DOB: Codable {
    let date: String
    let age: Int 
}


extension RandomUserData {
    static func getData() -> [UserData] {
        var user = [UserData]()
        guard let fileURL = Bundle.main.url(forResource: "random_user_generator_api", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(RandomUserData.self, from: data)
            user = userData.results
        } catch {
            print("failed to load contents \(error)")
        }
        return user
    }
}
