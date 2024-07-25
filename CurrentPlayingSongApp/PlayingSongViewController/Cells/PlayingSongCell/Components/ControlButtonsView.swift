//
//  ControlButtonsView.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/25.
//

import Foundation
import UIKit

class ControlButtonsView: UIView {
    
    lazy var shuffleButton: UIButton = {
        let button = UIButton(type: .system)
        let smallConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .small)
        button.setImage(UIImage(systemName: "shuffle", withConfiguration: smallConfig), for: .normal)
        
//        button.setImage(UIImage(systemName: "shuffle"), for: .normal)
        button.tintColor = SpotifyColors.spotifyGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .ultraLight, scale: .medium)
        button.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: largeConfig), for: .normal)
        button.tintColor = SpotifyColors.spotifyGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var controlsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shuffleButton, playButton])
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        addSubview(controlsStackView)

        controlsStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        controlsStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
