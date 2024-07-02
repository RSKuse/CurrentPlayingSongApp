//
//  UISetup.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/02.
//

import Foundation
import UIKit

extension CurrentPlayingSongViewController {
    
    func setupUI() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(songCollectionView)
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(songAndArtistTitleStackView)
        contentView.addSubview(playPauseButton)
        contentView.addSubview(shuffleButton)
        contentView.addSubview(previousButton)
        contentView.addSubview(nextButton)
        contentView.addSubview(shufflePlayRewindStackView)
        contentView.addSubview(durationSlider)
        contentView.addSubview(currentTimeLabel)
        contentView.addSubview(durationLabel)
        contentView.addSubview(addButton)
        contentView.addSubview(deviceButton)
        contentView.addSubview(playlistLabel)
        contentView.addSubview(downArrowButton)
        contentView.addSubview(moreOptionsButton)
        contentView.addSubview(timerButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(deviceTypeLabel)
        contentView.addSubview(artistInfoContainer)
        
        artistInfoContainer.addSubview(artistImageView)
        artistImageView.addSubview(aboutLabel)
        artistInfoContainer.addSubview(artistNameLabel)
        artistInfoContainer.addSubview(listenersLabel)
        artistInfoContainer.addSubview(artistDescriptionTextView)
        artistInfoContainer.addSubview(followButton)
        setupConstraints()
    }
    
    
    func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        // contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true // zzz: You had an extra constraint here.
        
        // zzz: This is where your red section was coming from
        songCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        songCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        songCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        songCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        albumCoverImageView.topAnchor.constraint(equalTo: songCollectionView.bottomAnchor, constant: 20).isActive = true
        albumCoverImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        albumCoverImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        songAndArtistTitleStackView.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 40).isActive = true
        songAndArtistTitleStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        addButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        addButton.centerYAnchor.constraint(equalTo: songAndArtistTitleStackView.centerYAnchor).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        durationSlider.topAnchor.constraint(equalTo: songAndArtistTitleStackView.bottomAnchor, constant: 20).isActive = true
        durationSlider.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        durationSlider.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        currentTimeLabel.leftAnchor.constraint(equalTo: durationSlider.leftAnchor).isActive = true
        currentTimeLabel.topAnchor.constraint(equalTo: durationSlider.bottomAnchor, constant: 2).isActive = true
        
        durationLabel.rightAnchor.constraint(equalTo: durationSlider.rightAnchor).isActive = true
        durationLabel.topAnchor.constraint(equalTo: durationSlider.bottomAnchor, constant: 2).isActive = true
        
        shufflePlayRewindStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        shufflePlayRewindStackView.topAnchor.constraint(equalTo: currentTimeLabel.bottomAnchor, constant: 20).isActive = true
        
        timerButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        timerButton.centerYAnchor.constraint(equalTo: shufflePlayRewindStackView.centerYAnchor).isActive = true
        timerButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        timerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        shuffleButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        shuffleButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        previousButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        playPauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nextButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        deviceButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        deviceButton.topAnchor.constraint(equalTo: shufflePlayRewindStackView.bottomAnchor, constant: 20).isActive = true
        deviceButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        deviceButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        shareButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        shareButton.topAnchor.constraint(equalTo: timerButton.bottomAnchor, constant: 20).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        downArrowButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        downArrowButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        downArrowButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        downArrowButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        playlistLabel.centerYAnchor.constraint(equalTo: downArrowButton.centerYAnchor).isActive = true
        playlistLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        moreOptionsButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        moreOptionsButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        moreOptionsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        moreOptionsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        deviceTypeLabel.leftAnchor.constraint(equalTo: deviceButton.rightAnchor, constant: 5).isActive = true
        deviceTypeLabel.centerYAnchor.constraint(equalTo: deviceButton.centerYAnchor).isActive = true
        
        
        artistInfoContainer.topAnchor.constraint(equalTo: deviceTypeLabel.bottomAnchor, constant: 20).isActive = true
        artistInfoContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        artistInfoContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        artistInfoContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        aboutLabel.topAnchor.constraint(equalTo: artistImageView.topAnchor, constant: 10).isActive = true
        aboutLabel.leftAnchor.constraint(equalTo: artistImageView.leftAnchor, constant: 10).isActive = true
        
        artistImageView.topAnchor.constraint(equalTo: artistInfoContainer.topAnchor).isActive = true
        artistImageView.leftAnchor.constraint(equalTo: artistInfoContainer.leftAnchor).isActive = true
        artistImageView.rightAnchor.constraint(equalTo: artistInfoContainer.rightAnchor).isActive = true
        artistImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 10).isActive = true
        artistNameLabel.leftAnchor.constraint(equalTo: artistInfoContainer.leftAnchor, constant: 10).isActive = true
        
        listenersLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 5).isActive = true
        listenersLabel.leftAnchor.constraint(equalTo: artistInfoContainer.leftAnchor, constant: 10).isActive = true
        
        artistDescriptionTextView.topAnchor.constraint(equalTo: listenersLabel.bottomAnchor, constant: 10).isActive = true
        artistDescriptionTextView.leftAnchor.constraint(equalTo: artistInfoContainer.leftAnchor, constant: 10).isActive = true
        artistDescriptionTextView.rightAnchor.constraint(equalTo: artistInfoContainer.rightAnchor, constant: -10).isActive = true
        
        followButton.topAnchor.constraint(equalTo: artistDescriptionTextView.bottomAnchor, constant: 10).isActive = true
        followButton.rightAnchor.constraint(equalTo: artistInfoContainer.rightAnchor, constant: -10).isActive = true
        followButton.bottomAnchor.constraint(equalTo: artistInfoContainer.bottomAnchor, constant: -10).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
}

