//
//  AlbumHeaderView.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//

import Foundation
import UIKit

class AlbumHeaderCell: UICollectionViewCell {
    
    lazy var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var albumTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var albumTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addToLibraryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.down.circle"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var moreOptionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        button.tintColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var shuffleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "shuffle"), for: .normal)
        button.tintColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(albumImageView)
        addSubview(albumTitleLabel)
        addSubview(artistImageView)
        addSubview(artistNameLabel)
        addSubview(albumTypeLabel)
        addSubview(addToLibraryButton)
        addSubview(downloadButton)
        addSubview(moreOptionsButton)
        addSubview(playButton)
        addSubview(shuffleButton)
        
        albumImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        albumImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        albumTitleLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 16).isActive = true
        albumTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        artistImageView.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: 8).isActive = true
        artistImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        artistImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        artistImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        artistNameLabel.centerYAnchor.constraint(equalTo: artistImageView.centerYAnchor).isActive = true
        artistNameLabel.leftAnchor.constraint(equalTo: artistImageView.rightAnchor, constant: 8).isActive = true
        
        albumTypeLabel.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 8).isActive = true
        albumTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        let buttonsStackView = UIStackView(arrangedSubviews: [addToLibraryButton, downloadButton, moreOptionsButton])
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 16
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonsStackView)
        
        buttonsStackView.topAnchor.constraint(equalTo: albumTypeLabel.bottomAnchor, constant: 8).isActive = true
        buttonsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        playButton.centerYAnchor.constraint(equalTo: buttonsStackView.centerYAnchor).isActive = true
        playButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        shuffleButton.centerYAnchor.constraint(equalTo: buttonsStackView.centerYAnchor).isActive = true
        shuffleButton.rightAnchor.constraint(equalTo: playButton.leftAnchor, constant: -16).isActive = true
        shuffleButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        shuffleButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func configure() {
        albumImageView.image = UIImage(named: "album_image")
        albumTitleLabel.text = "Emakhaya"
        artistImageView.image = UIImage(named: "artist_image")
        artistNameLabel.text = "Mlindo The Vocalist"
        albumTypeLabel.text = "2018"
    }
}
