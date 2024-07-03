//
//  CurrentPlayingSongViewController+Network.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

extension CurrentPlayingSongViewController {
    
    func fetchDataFromInternet() {
        guard let playingSong = JsonToSwiftConvert.convertToSwift(),
              let item = playingSong.item,
              let artists = item.artists else {
            return
        }
        
        displaySongArtists(artists: artists)
        devices = playingSong.devices
        updateUIFromCurrentPlayingSong(song: playingSong)
        self.selectedDevice = playingSong.device
        
        if let aboutArtist = playingSong.aboutArtist {
            aboutLabel.text = aboutArtist
        }
    }
    
}
