//
//  PlayingSongViewController.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class PlayingSongViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    enum PlayingSongSections: Int, CaseIterable {
        case playingSong
        case aboutArtist
        case credits
    }
    
    var collectionViewInserts: UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 16.0, bottom: -20.0, right: 16.0)
    }
    
    lazy var playingSongCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16.0
        flowLayout.minimumInteritemSpacing = 0.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.contentInset = collectionViewInserts
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(playingSongCollectionView)
        playingSongCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        playingSongCollectionView.bottomAnchor.constraint(equalTo: view.topAnchor).isActive = true
        playingSongCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        playingSongCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
