//
//  Devices.swift
//  SpotifyMusicApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation

// MARK: - Device
enum DeviceType: String, Codable {
    case computer
    case smartphone
    case vehicle
}

struct Device: Codable {
    var id: String?
    var isActive: Bool?
    var isPrivateSession: Bool?
    var isRestricted: Bool?
    var name: String?
    var type: DeviceType?
    var volumePercent: Int?
    var supportsVolume: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case isActive = "is_active"
        case isPrivateSession = "is_private_session"
        case isRestricted = "is_restricted"
        case name, type
        case volumePercent = "volume_percent"
        case supportsVolume = "supports_volume"
    }
    
    var iconName: String {
        switch type {
        case .computer:
            return "laptop_icon"
        case .smartphone:
            return "iphone_icon"
        default:
            return "default_device_icon"
        }
    }
}

