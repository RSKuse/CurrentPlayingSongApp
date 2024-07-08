//
//  SongControlsContainerView.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class SongControlsContainerView: UIView {
    
    var onPlayPauseButtonTapped: (() -> Void)?
    
    lazy var shuffleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.shuffleButton, for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.playPauseButton, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.previousButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.nextButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var repeatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.repeatImage, for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var controlsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shuffleButton, previousButton, playPauseButton, nextButton, repeatButton])
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupUI()
    }
    
    func setupUI() {
        addSubview(controlsStackView)
        
        controlsStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        controlsStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        controlsStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        shuffleButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        shuffleButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        previousButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        playPauseButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        nextButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        repeatButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func playPauseButtonTapped() {
        onPlayPauseButtonTapped?()
    }
}
