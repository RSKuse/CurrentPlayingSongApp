//
//  Tracks.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/26.
//

import Foundation

struct Tracks: Codable {
    var href: String?
    var limit: Int?
    var next: String?
    var offset: Int?
    var previous: String?
    var total: Int?
    var items: [Song]?
}
