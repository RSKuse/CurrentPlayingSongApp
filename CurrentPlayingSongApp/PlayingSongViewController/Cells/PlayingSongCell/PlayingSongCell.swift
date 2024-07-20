//
//  PlayingSongCell.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class PlayingSongCell: UICollectionViewCell {
    
    lazy var horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 50
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 350)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HorizontalSongCell.self, forCellWithReuseIdentifier: HorizontalSongCell.cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
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
        contentView.addSubview(horizontalCollectionView)
        contentView.addSubview(deviceControlAndShareSongView)
        contentView.addSubview(songControlsView)
        contentView.addSubview(playingSongSliderView)
        contentView.addSubview(playingSongTitleView)
        
        horizontalCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        horizontalCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        horizontalCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        horizontalCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        deviceControlAndShareSongView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        deviceControlAndShareSongView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        deviceControlAndShareSongView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        deviceControlAndShareSongView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        songControlsView.bottomAnchor.constraint(equalTo: deviceControlAndShareSongView.topAnchor, constant: -20).isActive = true
        songControlsView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        songControlsView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        songControlsView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        playingSongSliderView.bottomAnchor.constraint(equalTo: songControlsView.topAnchor, constant: -28).isActive = true
        playingSongSliderView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        playingSongSliderView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        playingSongSliderView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        playingSongTitleView.bottomAnchor.constraint(equalTo: playingSongSliderView.topAnchor, constant: -16).isActive = true
        playingSongTitleView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        playingSongTitleView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        playingSongTitleView.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Item) {
        // configure method implementation here
    }
}

extension PlayingSongCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 // Simulate 6 songs
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalSongCell.cellID, for: indexPath) as? HorizontalSongCell else {
            return UICollectionViewCell()
        }
        // Here we can set the same image for simulation purposes
        cell.albumCoverImageView.image = UIImage(named: "your_album_cover_image")
        return cell
    }
}

class HorizontalSongCell: UICollectionViewCell {
    
    lazy var albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(albumCoverImageView)
        
        albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        albumCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        albumCoverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        albumCoverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
