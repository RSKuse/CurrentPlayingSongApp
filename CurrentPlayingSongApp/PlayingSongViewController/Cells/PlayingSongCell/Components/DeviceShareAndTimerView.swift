//
//  DeviceShareAndTimerView.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/03.
//

import Foundation
import UIKit

class DeviceShareSongAndTimerView: UIView {
    var onDeviceButtonTapped: (() -> Void)?
    
    lazy var deviceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.deviceButton, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(deviceButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var deviceTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Gugulethu's Macbook Pro"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.timerButton, for: .normal)
        button.tintColor = .white
        // button.addTarget(self, action: #selector(deviceButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.shareButton, for: .normal)
        button.tintColor = .white
        // button.addTarget(self, action: #selector(deviceButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupUI()
    }
    
    func setupUI() {
        addSubview(deviceButton)
        addSubview(deviceTypeLabel)
        addSubview(timerButton)
        addSubview(shareButton)
        
        deviceButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        deviceButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        deviceButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        deviceButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        deviceTypeLabel.leftAnchor.constraint(equalTo: deviceButton.rightAnchor, constant: 8).isActive = true
        deviceTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        timerButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timerButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        timerButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        timerButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        shareButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        shareButton.rightAnchor.constraint(equalTo: timerButton.leftAnchor, constant: -16).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deviceButtonTapped() {
        onDeviceButtonTapped?()
    }
}


