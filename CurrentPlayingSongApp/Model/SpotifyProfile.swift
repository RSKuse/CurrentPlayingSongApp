//
//  SpotifyProfile.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/27.
//

import Foundation

struct SpotifyProfile {
    var name: String
    var surname: String
    var userName: String
    var price: Double
    
    var displayName: String {
        return "\(name) \(surname)"
    }
    
    var userNameValue: String {
        return "@\(userName)"
    }
    
    var priceValue: String {
        return String(format: "R%.2f", price)
    }
    
    func doSomething() {
        
    }
    
    
}
