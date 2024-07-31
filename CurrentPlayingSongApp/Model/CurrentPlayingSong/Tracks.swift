//
//  Tracks.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/29.
//

import Foundation

// MARK: - Tracks
struct Tracks: Codable {
    var href: String?
    var limit: Int?
    var next: String?
    var offset: Int?
    var previous: String?
    var total: Int?
    var items: [Item]?
}

