//
//  Artist.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

// MARK: - ItemArtist
struct ItemArtist: Codable {
    var externalUrls: ExternalUrls?
    var followers: Followers?
    var genres: [String]?
    var href, id: String?
    var images: [Image]?
    var name: String?
    var popularity: Int?
    var type, uri: String?

    enum CodingKeys: String, CodingKey {
        case externalUrls
        case followers, genres, href, id, images, name, popularity, type, uri
    }
}

// MARK: - Followers
struct Followers: Codable {
    var href: String?
    var total: Int?
}

// MARK: - ExternalIDS
struct ExternalIDS: Codable {
    var isrc, ean, upc: String?
}

// MARK: - LinkedFrom
struct LinkedFrom: Codable {
}
