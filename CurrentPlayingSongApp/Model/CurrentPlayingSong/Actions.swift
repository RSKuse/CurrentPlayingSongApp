//
//  Actions.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation


// MARK: - Actions
struct Actions: Codable {
    var interruptingPlayback, pausing, resuming, seeking: Bool?
    var skippingNext, skippingPrev, togglingRepeatContext, togglingShuffle: Bool?
    var togglingRepeatTrack, transferringPlayback: Bool?

    enum CodingKeys: String, CodingKey {
        case interruptingPlayback = "interrupting_playback"
        case pausing, resuming, seeking
        case skippingNext = "skipping_next"
        case skippingPrev = "skipping_prev"
        case togglingRepeatContext = "toggling_repeat_context"
        case togglingShuffle = "toggling_shuffle"
        case togglingRepeatTrack = "toggling_repeat_track"
        case transferringPlayback = "transferring_playback"
    }
}

// MARK: - Context
struct Context: Codable {
    var type, href: String?
    var externalUrls: ExternalUrls?
    var uri: String?

    enum CodingKeys: String, CodingKey {
        case type, href
        case externalUrls = "external_urls"
        case uri
    }
}

// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    var spotify: String?
}
