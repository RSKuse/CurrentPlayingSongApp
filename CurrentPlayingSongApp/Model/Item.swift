//
//  Item.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

// MARK: - Item
struct Item: Codable {
    var album: Album?
    var artists: [ItemArtist]?
    var availableMarkets: [String]?
    var discNumber: Int?
    var durationMS: Int?
    var explicit: Bool?
    var externalIDS: ExternalIDS?
    var externalUrls: ExternalUrls?
    var href, id: String?
    var isPlayable: Bool?
    var linkedFrom: LinkedFrom?
    var restrictions: Restrictions?
    var name: String?
    var popularity: Int?
    var previewURL: String?
    var trackNumber: Int?
    var type, uri: String?
    var isLocal: Bool?

    enum CodingKeys: String, CodingKey {
        case album, artists
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMS = "duration_ms"
        case explicit
        case externalIDS = "external_ids"
        case externalUrls = "external_urls"
        case href, id
        case isPlayable = "is_playable"
        case linkedFrom = "linked_from"
        case restrictions, name, popularity
        case previewURL = "preview_url"
        case trackNumber = "track_number"
        case type, uri
        case isLocal = "is_local"
    }
}
