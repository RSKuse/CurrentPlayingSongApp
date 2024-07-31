//
//  Artist.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

// MARK: - Artist
struct Artist: Codable {
    var externalUrls: ExternalUrls?
    var followers: Followers?
    var genres: [String]?
    var href, id: String?
    var images: [Image]?
    var name: String?
    var type: String?
    var uri: String?
    var popularity: Int?
    var description: String?

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case followers, genres, href, id, images, name, popularity, type, uri, description
    }
}

// MARK: - Followers
struct Followers: Codable {
    var href: String?
    var total: Int?
}
