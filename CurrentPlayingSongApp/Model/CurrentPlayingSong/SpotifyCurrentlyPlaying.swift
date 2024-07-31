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
    var devices: [Device]?
    var aboutArtist: String?

    enum CodingKeys: String, CodingKey {
        case device
        case repeatState = "repeat_state"
        case shuffleState = "shuffle_state"
        case context, timestamp
        case progressMS = "progress_ms"
        case isPlaying = "is_playing"
        case item
        case currentlyPlayingType = "currently_playing_type"
        case actions, devices
        case aboutArtist = "about_artist"
    }
}







