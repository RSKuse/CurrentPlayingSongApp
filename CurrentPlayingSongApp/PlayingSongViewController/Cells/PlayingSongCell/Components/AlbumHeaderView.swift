//
//  AlbumHeaderView.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//
//import Foundation
//import UIKit
//
//class AlbumHeaderCell: UICollectionViewCell {
//    
//    lazy var albumImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    lazy var albumTitleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    lazy var artistLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .lightGray
//        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupUI() {
//        addSubview(albumImageView)
//        addSubview(albumTitleLabel)
//        addSubview(artistLabel)
//        
//        albumImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        albumImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        albumImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        albumImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        
//        albumTitleLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 16).isActive = true
//        albumTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        albumTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
//        
//        artistLabel.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: 8).isActive = true
//        artistLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        artistLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
//    }
//    
//    func configure() {
//        albumImageView.image = UIImage(named: "album_image") // Placeholder image
//        albumTitleLabel.text = "Album Title"
//        artistLabel.text = "Artist Name"
//    }
//}
