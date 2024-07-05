//
//  PlayingSongCell.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class PlayingSongCell: UICollectionViewCell {
    
    lazy var albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var playingSongTitleView: SongTitleContainerView = {
        let view = SongTitleContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var playingSongSliderView: PlayingSongSliderView = {
        let view = PlayingSongSliderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var songControlsView: SongControlsContainerView = {
        let view = SongControlsContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var deviceControlAndShareSongView: DeviceShareSongAndTimerView = {
        let view = DeviceShareSongAndTimerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(deviceControlAndShareSongView)
        addSubview(songControlsView)
        addSubview(playingSongSliderView)
        addSubview(playingSongTitleView)
        addSubview(albumCoverImageView)
        
        deviceControlAndShareSongView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        deviceControlAndShareSongView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        deviceControlAndShareSongView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        deviceControlAndShareSongView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        songControlsView.bottomAnchor.constraint(equalTo: deviceControlAndShareSongView.topAnchor, constant: -20).isActive = true
        songControlsView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        songControlsView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        songControlsView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        playingSongSliderView.bottomAnchor.constraint(equalTo: songControlsView.topAnchor, constant: -28).isActive = true
        playingSongSliderView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        playingSongSliderView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        playingSongSliderView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        playingSongTitleView.bottomAnchor.constraint(equalTo: playingSongSliderView.topAnchor, constant: -16).isActive = true
        playingSongTitleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        playingSongTitleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        playingSongTitleView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        albumCoverImageView.bottomAnchor.constraint(equalTo: playingSongTitleView.topAnchor, constant: -50).isActive = true
        albumCoverImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        albumCoverImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Item) {
        if let imageUrlString = item.album?.images?.first?.url, let imageUrl = URL(string: imageUrlString) {
            // Assume you have a method or extension to load images from URL
            albumCoverImageView.loadImage(from: imageUrl)
        }
        playingSongTitleView.songTitleLabel.text = item.name
        playingSongTitleView.artistLabel.text = item.artists?.first?.name
    }
    

    
}
