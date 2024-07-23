//
//  Actions.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

struct Actions: Codable {
    var interruptingPlayback, pausing, resuming, seeking: Bool?
    var skippingNext, skippingPrev, togglingRepeatContext, togglingShuffle: Bool?
    var togglingRepeatTrack, transferringPlayback: Bool?

    enum CodingKeys: String, CodingKey {
        case interruptingPlayback
        case pausing, resuming, seeking
        case skippingNext
        case skippingPrev
        case togglingRepeatContext
        case togglingShuffle
        case togglingRepeatTrack
        case transferringPlayback
    }
}

// MARK: - Context
struct Context: Codable {
    var type, href: String?
    var externalUrls: ExternalUrls?
    var uri: String?

    enum CodingKeys: String, CodingKey {
        case type, href
        case externalUrls
        case uri
    }
}

// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    var spotify: String?
}
