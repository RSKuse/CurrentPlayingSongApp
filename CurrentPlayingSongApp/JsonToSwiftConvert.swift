//
//  JsonToSwiftConvert.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

class JsonToSwiftConvert {
    class func convertToSwift() -> SpotifyCurrentPlayingSong? {
        do {
            guard let path = Bundle.main.path(forResource: "CurrentlyPlayingSong", ofType: "json") else {
                print("JSON file not found")
                return nil
            }
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let model = try JSONDecoder().decode(SpotifyCurrentPlayingSong.self, from: data)
            return model
        } catch let error {
            print("Error parsing JSON: \(error)")
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
