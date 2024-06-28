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
    var href, id: String?
    var images: [Image]?
    var name, releaseDate, releaseDatePrecision: String?
    var restrictions: Restrictions?
    var type, uri: String?
    var artists: [AlbumArtist]?

    enum CodingKeys: String, CodingKey {
        case albumType
        case totalTracks
        case availableMarkets
        case externalUrls
        case href, id, images, name
        case releaseDate
        case releaseDatePrecision
        case restrictions, type, uri, artists
    }
}

// MARK: - AlbumArtist
struct AlbumArtist: Codable {
    var externalUrls: ExternalUrls?
    var href, id, name, type: String?
    var uri: String?

    enum CodingKeys: String, CodingKey {
        case externalUrls
        case href, id, name, type, uri
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
