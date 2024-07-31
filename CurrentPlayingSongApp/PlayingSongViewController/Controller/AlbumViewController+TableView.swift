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
        cell.configure(trackTitle: track.name ?? "Unknown Title", artistName: track.artists?.first?.name ?? "Unknown Artist")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
