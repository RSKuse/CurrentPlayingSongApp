//
//  JsonToSwiftConvert.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

class JsonToSwiftConvert {
    
    // This function uses Generics. // the two <> are known as generics
    static func convertToSwift<Model: Decodable>(fileName: String, model: Model.Type) -> Model? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return nil }
        do {
            let data = try Data(contentsOf: url)
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            }
            let decodedData = try JSONDecoder().decode(Model.self, from: data)
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
    class func fetchDevices() -> [Device]? {
        do {
            guard let path = Bundle.main.path(forResource: "CurrentlyPlayingSong", ofType: "json") else {
                return nil
            }
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let model = try JSONDecoder().decode(SpotifyCurrentPlayingSong.self, from: data)
            return model.devices
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    }
}
