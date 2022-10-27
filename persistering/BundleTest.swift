//
//  BundleTest.swift
//  persistering
//
//  Created by ksd on 25/10/2022.
//

import Foundation
import UIKit

struct TestData {
    static var earthquakes: [Earthquake] = {
        let url = Bundle.main.url(forResource: "Earthquake", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode([Earthquake].self, from: data)
    }()
    
    
    
    func write<T: Encodable>(_ object: T, toJson file: String) {
        let homeFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        guard let path = homeFolder?.appendingPathComponent(file) else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(object)
            try data.write(to: path)
        }
        catch {
            print("Could not write file \(path): \(error)")
        }
    }
    
    static func imageData() -> Data? {
        let image = UIImage(named: "Beagle")
        return image?.pngData()
    }
}


struct Earthquake: Codable, Identifiable {
    let properties: Property
    let id: String
    
    struct Property: Codable {
        let mag: Double
        let place: String
    }
}


