//
//  PlayingSongCell.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class PlayingSongCell: UICollectionViewCell {
    
    var albumHeight: CGFloat?
    var colors: [UIColor] = [.red, .green, .blue, .yellow, .purple, .orange]
    var albumImageURLToLoad: URL?
    
    lazy var horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: frame.width, height: frame.height)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = UIColor.red
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
        horizontalCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        deviceControlAndShareSongView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        deviceControlAndShareSongView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        deviceControlAndShareSongView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        deviceControlAndShareSongView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        songControlsView.bottomAnchor.constraint(equalTo: deviceControlAndShareSongView.topAnchor, constant: -20).isActive = true
        songControlsView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        songControlsView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        songControlsView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        playingSongSliderView.bottomAnchor.constraint(equalTo: songControlsView.topAnchor, constant: -20).isActive = true
        playingSongSliderView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        playingSongSliderView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        playingSongSliderView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        playingSongTitleView.bottomAnchor.constraint(equalTo: playingSongSliderView.topAnchor, constant: -20).isActive = true
        playingSongTitleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        playingSongTitleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        playingSongTitleView.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Song?, albumImageUrl: URL) {
        guard let item = item else { return }
        playingSongTitleView.songTitleLabel.text = item.name
        if let artistName = item.artists?.first?.name {
            playingSongTitleView.artistLabel.text = artistName
        }
        horizontalCollectionView.reloadData()
        albumImageURLToLoad = albumImageUrl
    }
    func updateSlider(elapsedSeconds: Int, songDuration: Int) {
        playingSongSliderView.updateSlider(elapsedTime: elapsedSeconds, totalDuration: songDuration)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        let colorIndex = Int(pageIndex) % colors.count
        UIView.animate(withDuration: 0.0) {
            self.horizontalCollectionView.backgroundColor = self.colors[colorIndex]  // Ensure the correct view's background color is being changed
        }
    }
    
    //    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    //        <#code#>
    //    }
}



extension PlayingSongCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 // Simulate 6 songs
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalSongCell.cellID, for: indexPath) as? HorizontalSongCell else {
            return UICollectionViewCell()
        }
        cell.albumHeight = albumHeight
        if let albumImageURLToLoad = albumImageURLToLoad {
            cell.albumCoverImageView.loadImage(from: albumImageURLToLoad)
        }
        
        return cell
    }
}

class HorizontalSongCell: UICollectionViewCell {
    
    //var colors: [UIColor] = [.red, .green, .blue, .yellow, .purple, .orange]
    
    var albumHeight: CGFloat?
    
    lazy var albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
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
        let width = frame.width - 40
        contentView.addSubview(albumCoverImageView)
        
        albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150).isActive = true
        albumCoverImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        albumCoverImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

