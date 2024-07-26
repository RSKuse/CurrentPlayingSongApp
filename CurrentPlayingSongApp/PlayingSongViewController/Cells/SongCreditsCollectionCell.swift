//
//  SongCreditsCollectionCell.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class SongCreditsCollectionCell: UICollectionViewCell {
    
    lazy var creditsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Credits"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(SpotifyColors.spotifyGreen, for: .normal)
        button.setTitle("Show all", for: .normal)
        button.contentHorizontalAlignment = .right
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkText
        layer.cornerRadius = 20.0
        layer.masksToBounds = true
        setupUI()
    }
    
    func setupUI() {
        addSubview(creditsLabel)
        addSubview(showAllButton)
        
        creditsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        creditsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        showAllButton.centerYAnchor.constraint(equalTo: creditsLabel.centerYAnchor).isActive = true
        showAllButton.rightAnchor.constraint(equalTo: rightAnchor,
                                             constant: -20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with artist: Artist) {
        creditsLabel.text = "Credits: \(artist.name ?? "")"
    }

    
}
