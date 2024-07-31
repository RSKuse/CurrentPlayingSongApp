//
//  AlbumViewController+TableView.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/25.
//

import Foundation
import UIKit

extension AlbumViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.cellID, for: indexPath) as! SongCell
        let track = tracks[indexPath.row]
        let isDownloaded = checkIfTrackIsDownloaded(track: track)
        cell.configure(trackTitle: track.name ?? "Unknown Title", artistName: track.artists?.first?.name ?? "Unknown Artist", isDownloaded: isDownloaded)
        cell.trackTitleLabel.textColor = (indexPath.row == selectedTrackIndex) ? SpotifyColors.spotifyGreen : .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTrackIndex = indexPath.row
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func checkIfTrackIsDownloaded(track: Item) -> Bool {
        let downloadedTrackDict = ["6OmhkSOpvYBokMKQxpIGx2": true, "6Q4PYJtrq8CBx7YCY5IyRN": true]
        guard let trackID = track.id else {
            return false
        }
        return downloadedTrackDict[trackID] ?? false
    }
}
