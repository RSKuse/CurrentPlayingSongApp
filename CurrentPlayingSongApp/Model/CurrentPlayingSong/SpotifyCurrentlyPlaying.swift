//
//  SpotifyCurrentlyPlaying.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
// let spotifyCurrentPlayingSong = try? JSONDecoder().decode(SpotifyCurrentPlayingSong.self, from: jsonData)

import Foundation

// MARK: - SpotifyCurrentPlayingSong

struct SpotifyCurrentPlayingSong: Codable {
    var device: Device?
    var repeatState: String?
    var shuffleState: Bool?
    var context: Context?
    var timestamp, progressMS: Int?
    var isPlaying: Bool?
    var item: Item?
    var currentlyPlayingType: String?
    var actions: Actions?
    var devices: [Device]? // Add this line
    var aboutArtist: String?

    enum CodingKeys: String, CodingKey {
        case device
        case repeatState
        case shuffleState
        case context, timestamp
        case progressMS = "progress_ms"
        case isPlaying = "is_playing"
        case item
        case currentlyPlayingType
        case actions
        case devices // Add this line
        case aboutArtist = "about_artist"
        
    }
}








