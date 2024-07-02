//
//  AboutArtistCollectionCell.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class AboutArtistCollectionCell: UICollectionViewCell {
    
    lazy var aboutArtistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "About the artist"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.text = "JAY-Z"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var listenersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "34.3M montly listeners"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 3
        label.text = "Shawn Corey Carter, known professionally as Jay-Z, is an American rapper and entrepreneur. Born and raised in New York City, he was named the greatest rapper of all time by Billboard and Vibe in 2023"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [artistLabel, listenersLabel])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkText
        layer.cornerRadius = 20.0
        layer.masksToBounds = true
        setupUI()
    }
    
    func setupUI() {
        addSubview(artistImageView)
        addSubview(aboutArtistLabel)
        addSubview(artistStackView)
        addSubview(artistDescriptionLabel)
        
        artistImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        artistImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        artistImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        artistImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        aboutArtistLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        aboutArtistLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        artistStackView.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 16).isActive = true
        artistStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        artistStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        artistDescriptionLabel.topAnchor.constraint(equalTo: artistStackView.bottomAnchor, constant: 10).isActive = true
        artistDescriptionLabel.leftAnchor.constraint(equalTo: artistStackView.leftAnchor).isActive = true
        artistDescriptionLabel.rightAnchor.constraint(equalTo: artistStackView.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
