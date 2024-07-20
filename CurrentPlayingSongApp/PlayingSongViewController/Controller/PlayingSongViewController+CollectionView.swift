//
//  PlayingSongViewController+CollectionView.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

extension PlayingSongViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlayingSongCells.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch PlayingSongCells(rawValue: indexPath.item) {
        case .playingSong:
            guard let playingSongCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayingSongCell.cellID,
                                                                           for: indexPath) as? PlayingSongCell else {
                return UICollectionViewCell()
            }
            if let item = currentlyPlayingSong?.item {
                playingSongCell.configure(with: item)
                playingSongCell.songControlsView.onPlayPauseButtonTapped = {
                    self.playPauseButtonTapped()
                    }
                playingSongCell.deviceControlAndShareSongView.onDeviceButtonTapped = {
                    self.deviceButtonTapped()
                }
                
            }
            return playingSongCell
        case .aboutArtist:
            guard let aboutArtistCell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutArtistCollectionCell.cellID,
                                                                           for: indexPath) as? AboutArtistCollectionCell else {
                return UICollectionViewCell()
            }
            return aboutArtistCell
        default:
            guard let songCreditsCell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCreditsCollectionCell.cellID,
                                                                           for: indexPath) as? SongCreditsCollectionCell else {
                return UICollectionViewCell()
            }
            return songCreditsCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch PlayingSongCells(rawValue: indexPath.item) {
        case .playingSong:
            return songCellSize
        case .aboutArtist:
            return aboutArtistCellSize
        default:
            return credistsCellSize
        }
    }
}

