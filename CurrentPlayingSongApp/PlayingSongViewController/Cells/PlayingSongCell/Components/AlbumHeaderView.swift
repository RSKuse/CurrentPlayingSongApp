//
//  AlbumHeaderView.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//

import Foundation
import UIKit

class AlbumHeaderView: UIView {
    
    lazy var albumArtworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "album_image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var albumTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ImageArtistNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [artistImageView, artistNameLabel])
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var albumInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor.systemGray3.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        let smallConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .thin, scale: .small)
        button.setImage(UIImage(systemName: "plus.circle", withConfiguration: smallConfig), for: .normal)
        button.tintColor = .systemGray3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton(type: .system)
        let smallConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .thin, scale: .small)
        button.setImage(UIImage(systemName: "arrow.down.circle", withConfiguration: smallConfig), for: .normal)
        button.tintColor = .systemGray3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var moreOptionsButton: UIButton = {
        let button = UIButton(type: .system)
        let smallConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .thin, scale: .small)
        button.setImage(UIImage(systemName: "ellipsis", withConfiguration: smallConfig), for: .normal)
        button.tintColor = .systemGray3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var actionButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [albumImageView, addButton, downloadButton, moreOptionsButton])
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var artistInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [albumTitleLabel, ImageArtistNameStackView, albumInfoLabel, actionButtonsStackView])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var controlButtonsView: ControlButtonsView = {
        let view = ControlButtonsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        
        addSubview(albumArtworkImageView)
        addSubview(artistImageView)
        addSubview(artistInfoStackView)
        addSubview(controlButtonsView)
        
        albumArtworkImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        albumArtworkImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        albumArtworkImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        albumArtworkImageView.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        
//        albumArtworkImageView.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        artistImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        artistImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        albumImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
   
        artistInfoStackView.topAnchor.constraint(equalTo: albumArtworkImageView.bottomAnchor, constant: 16).isActive = true
        artistInfoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        artistInfoStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true

        controlButtonsView.centerYAnchor.constraint(equalTo: actionButtonsStackView.centerYAnchor).isActive = true
        controlButtonsView.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
    }
    
    func configure(with album: Album?) {
        guard let album = album else { return }
        albumTitleLabel.text = album.name
        artistNameLabel.text = album.artists?.first?.name
        if let urlString = album.images?.first?.url, let url = URL(string: urlString) {
            // Load image asynchronously
            loadImage(from: url) { [weak self] image in
                DispatchQueue.main.async {
                    self?.albumArtworkImageView.image = image
                }
            }
        } else {
            albumArtworkImageView.image = UIImage(named: "default_image") // Fallback image
        }
    }
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }
}
