//
//  Album.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    var albumType: String?
    var totalTracks: Int?
    var availableMarkets: [String]?
    var externalUrls: ExternalUrls?
    var href: String?
    var id: String?
    var images: [Image]?
    var name, releaseDate, releaseDatePrecision, type: String?
    var uri: String?
    var artists: [Artist]?
    var tracks: Tracks?

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case totalTracks = "total_tracks"
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href, id, images, name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case type, uri, artists, tracks
    }
}

// MARK: - Image
struct Image: Codable {
    var url: String?
    var height, width: Int?
}

// MARK: - Restrictions
struct Restrictions: Codable {
    var reason: String?
}

