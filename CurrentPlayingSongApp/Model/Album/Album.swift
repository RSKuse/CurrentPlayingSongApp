//
//  AlbumModel.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/26.
//

import Foundation

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
    var copyrights: [Copyright]?
    var externalIDS: ExternalIDS?
    var genres: [String]?
    var label: String?
    var popularity: Int?

    enum CodingKeys: String, CodingKey {
        case albumType
        case totalTracks
        case availableMarkets
        case externalUrls
        case href, id, images, name
        case releaseDate
        case releaseDatePrecision
        case type, uri, artists, tracks, copyrights
        case externalIDS
        case genres, label, popularity
    }
}

// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    var spotify: String?
}

enum ArtistType: String, Codable {
    case artist = "artist"
}

// MARK: - Copyright
struct Copyright: Codable {
    var text, type: String?
}

// MARK: - ExternalIDS
struct ExternalIDS: Codable {
    var upc: String?
}

enum ItemType: String, Codable {
    case track = "track"
}
