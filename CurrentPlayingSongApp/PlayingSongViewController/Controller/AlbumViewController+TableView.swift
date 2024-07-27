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
        return 12 // Number of tracks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.cellID, for: indexPath) as! SongCell
        cell.configure(trackTitle: "Track Title \(indexPath.row + 1)", artistName: "Artist Name")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // Height for each track cell
    }
}
