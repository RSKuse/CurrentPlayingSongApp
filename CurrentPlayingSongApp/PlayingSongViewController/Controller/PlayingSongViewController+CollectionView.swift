//
//  PlayingSongViewController+CollectionView.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

extension PlayingSongViewController: UIScrollViewDelegate  {

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
            playingSongCell.albumHeight = albumViewHeight

            if let albumImageUrlString = currentlyPlayingSong?.item?.album?.images?.first?.url,
               let albumImageUrl = URL(string: albumImageUrlString),
               let item = currentlyPlayingSong?.item {
                playingSongCell.configure(with: item, albumImageUrl: albumImageUrl)
            }

            playingSongCell.songControlsView.onPlayPauseButtonTapped = {
                self.playPauseButtonTapped()
            }
            playingSongCell.deviceControlAndShareSongView.onDeviceButtonTapped = {
                self.deviceButtonTapped()
            }

            return playingSongCell
        case .aboutArtist:
            guard let aboutArtistCell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutArtistCollectionCell.cellID,
                                                                           for: indexPath) as? AboutArtistCollectionCell else {
                return UICollectionViewCell()
            }
            if let artist = currentlyPlayingSong?.item?.artists?.first {
                aboutArtistCell.configure(with: artist)
                aboutArtistCell.artistDescriptionLabel.addGestureRecognizer(UITapGestureRecognizer(target: aboutArtistCell, action: #selector(aboutArtistCell.toggleDescription))) // Ensure the correct target is set
            }
            return aboutArtistCell
        default:
            guard let songCreditsCell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCreditsCollectionCell.cellID,
                                                                           for: indexPath) as? SongCreditsCollectionCell else {
                return UICollectionViewCell()
            }
            if let artist = currentlyPlayingSong?.item?.album?.artists?.first {
                songCreditsCell.configure(with: artist)
            }
            return songCreditsCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch PlayingSongCells(rawValue: indexPath.item) {
        case .playingSong:
            return CGSize(width: view.frame.width, height: view.frame.height - 50)
        case .aboutArtist:
            return aboutArtistCellSize
        default:
            return credistsCellSize
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let horizontalSongCell = playingSongCollectionView.visibleCells.first as? PlayingSongCell {
            horizontalSongCell.scrollViewDidEndDecelerating(scrollView)
        }
    }
    
}
