//
//  TrackCell.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//

import Foundation
import UIKit

class SongCell: UITableViewCell {

    static let cellID = "SongCell"

    lazy var trackTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var trackInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [trackTitleLabel, artistNameLabel])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var optionsButton: UIButton = {
        let button = UIButton(type: .system)
        let smallConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .thin, scale: .small)
        button.setImage(UIImage(systemName: "ellipsis", withConfiguration: smallConfig), for: .normal)
        button.tintColor = .systemGray3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
//        addSubview(trackTitleLabel)
//        addSubview(artistNameLabel)
        addSubview(trackInfoStackView)
        addSubview(optionsButton)
        
        
        trackInfoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        trackInfoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        trackInfoStackView.rightAnchor.constraint(equalTo: optionsButton.leftAnchor, constant: -8).isActive = true
        
//        trackTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
//        trackTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        
//        artistNameLabel.leftAnchor.constraint(equalTo: trackTitleLabel.leftAnchor).isActive = true
//        artistNameLabel.topAnchor.constraint(equalTo: trackTitleLabel.bottomAnchor, constant: 4).isActive = true
//        artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        optionsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        optionsButton.centerYAnchor.constraint(equalTo: trackInfoStackView.centerYAnchor).isActive = true
        
    }
    
    func configure(trackTitle: String, artistName: String) {
        trackTitleLabel.text = trackTitle
        artistNameLabel.text = artistName
    }
}
