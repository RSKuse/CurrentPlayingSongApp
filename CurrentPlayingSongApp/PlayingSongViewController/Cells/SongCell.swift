//
//  TrackCell.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//

import Foundation
import UIKit

class SongCell: UICollectionViewCell {
    
    lazy var songTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var moreOptionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .white
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
        addSubview(songTitleLabel)
        addSubview(artistNameLabel)
        addSubview(moreOptionsButton)
        
        songTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        songTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: 4).isActive = true
        artistNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        moreOptionsButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        moreOptionsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        moreOptionsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        moreOptionsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func configure(songNumber: Int) {
        songTitleLabel.text = "Song Title \(songNumber)"
        artistNameLabel.text = "Artist Name"
    }
}
