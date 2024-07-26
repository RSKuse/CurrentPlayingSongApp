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
/*
// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    var spotify: String?
}
*/
