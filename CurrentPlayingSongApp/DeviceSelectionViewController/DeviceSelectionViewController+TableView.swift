//
//  DeviceSelectionViewController+TableView.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

extension DeviceSelectionViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceTableViewCell.cellID, for: indexPath) as? DeviceTableViewCell else {
            fatalError("Unable to dequeue DeviceTableViewCell") // ALSO this syntax
        }
        let device = devices[indexPath.row]
        cell.deviceNameLabel.text = device.name
        cell.deviceIconImageView.image = UIImage(named: device.iconName)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDevice = devices[indexPath.row]
        didSelectDevice?(selectedDevice)
        dismiss(animated: true, completion: nil)
    }
}

