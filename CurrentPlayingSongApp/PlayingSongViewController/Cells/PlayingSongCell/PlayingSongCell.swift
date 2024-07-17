import Foundation
import UIKit

class PlayingSongCell: UICollectionViewCell {
    

    
    lazy var horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 700)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HorizontalSongCell.self, forCellWithReuseIdentifier: HorizontalSongCell.cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
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
        contentView.addSubview(horizontalCollectionView)
        contentView.addSubview(deviceControlAndShareSongView)
        contentView.addSubview(songControlsView)
        contentView.addSubview(playingSongSliderView)
        contentView.addSubview(playingSongTitleView)
        contentView.addSubview(albumCoverImageView)
        
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
        
        albumCoverImageView.bottomAnchor.constraint(equalTo: playingSongTitleView.topAnchor, constant: -50).isActive = true
        albumCoverImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        albumCoverImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
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
        
        // Set duration label
        if let durationMS = item.durationMS {
            let songDuration = durationMS / 1000
            let minutes = songDuration / 60
            let seconds = songDuration % 60
            playingSongSliderView.durationLabel.text = String(format: "%02d:%02d", minutes, seconds)
            playingSongSliderView.durationSlider.maximumValue = Float(songDuration)
            playingSongSliderView.durationSlider.value = 0
            playingSongSliderView.currentTimeLabel.text = "00:00"
        }
    }
}

extension PlayingSongCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 // Simulate 6 songs
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalSongCell.cellID, for: indexPath) as! HorizontalSongCell
        cell.backgroundColor = .blue // For testing purposes
        // Configure the cell with your data
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
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
        addSubview(albumCoverImageView)
        
        albumCoverImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        albumCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        albumCoverImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        albumCoverImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
