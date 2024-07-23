//
//  TrackCell.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//

//import Foundation
//import UIKit
//
//class TrackCell: UICollectionViewCell {
//    
//    lazy var trackNumberLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    lazy var trackNameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    lazy var trackDurationLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        label.textColor = .lightGray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupUI() {
//        addSubview(trackNumberLabel)
//        addSubview(trackNameLabel)
//        addSubview(trackDurationLabel)
//        
//        
//        trackNumberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        trackNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        
//        trackNameLabel.leftAnchor.constraint(equalTo: trackNumberLabel.rightAnchor, constant: 16).isActive = true
//        trackNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        
//        trackDurationLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
//        trackDurationLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        
//    }
//    
//    func configure(with track: TrackItem) {
//        trackNumberLabel.text = "\(track.trackNumber ?? 0)"
//        trackNameLabel.text = track.name
//        trackDurationLabel.text = "\(track.durationMS ?? 0 / 1000) s"
//    }
//}
