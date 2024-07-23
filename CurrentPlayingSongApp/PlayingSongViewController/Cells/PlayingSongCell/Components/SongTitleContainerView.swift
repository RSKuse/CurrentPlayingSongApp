//
//  SongTitleContainerView.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class SongTitleContainerView: UIView {
    
    lazy var songTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        //label.text = "Never Change"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        //label.text = "Jay-Z"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var songAndArtistTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [songTitleLabel, artistLabel])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.addButton, for: .normal)
        button.tintColor = .white
        // button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupUI()
    }
    
    func setupUI() {
        addSubview(addButton)
        addSubview(songAndArtistTitleStackView)
        
        addButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        addButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        songAndArtistTitleStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        songAndArtistTitleStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        songAndArtistTitleStackView.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
