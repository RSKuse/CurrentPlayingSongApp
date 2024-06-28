//
//  DeviceTableViewCell.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/27.
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import Foundation
import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    lazy var deviceIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var deviceNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(deviceIconImageView)
        addSubview(deviceNameLabel)
        
        
        
        deviceIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        deviceIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        deviceIconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        deviceIconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        deviceNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        deviceNameLabel.leadingAnchor.constraint(equalTo: deviceIconImageView.trailingAnchor, constant: 15).isActive = true
        
    }
}
