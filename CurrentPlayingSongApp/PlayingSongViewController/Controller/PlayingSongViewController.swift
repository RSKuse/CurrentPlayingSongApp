//
//  PlayingSongViewController.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

class PlayingSongViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var currentlyPlayingSong: SpotifyCurrentPlayingSong?
    
    
    
    /**
     This enum allows you to use it instead of indexpaths. I will explain it in a call.
     */
    enum PlayingSongCells: Int, CaseIterable {
        case playingSong
        case aboutArtist
        case credits
    }
    
    var flowLayout: UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16.0
        flowLayout.minimumInteritemSpacing = 16.0
        return flowLayout
    }
    
    lazy var playingSongCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = playingSongEdgeInsets
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never // makes the collectionview anchor itself to the very top of the screen
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightText
        setupUI()
        registerCollectionViewCells()
        fetchCurrentlyPlayingSong()
    }
    
    func fetchCurrentlyPlayingSong() {
        currentlyPlayingSong = JsonToSwiftConvert.convertToSwift()
        playingSongCollectionView.reloadData()
    }
    
    func setupUI() {
        view.addSubview(playingSongCollectionView)
        playingSongCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        playingSongCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        playingSongCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        playingSongCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func registerCollectionViewCells() {
        playingSongCollectionView.register(PlayingSongCell.self, forCellWithReuseIdentifier: PlayingSongCell.cellID)
        playingSongCollectionView.register(AboutArtistCollectionCell.self, forCellWithReuseIdentifier: AboutArtistCollectionCell.cellID)
        playingSongCollectionView.register(SongCreditsCollectionCell.self, forCellWithReuseIdentifier: SongCreditsCollectionCell.cellID)
    }
}

// MARK: Interface Constants
extension PlayingSongViewController {
    
    var playingSongEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 0.0, bottom: 20.0, right: 0.0)
    }
    
    var songCellSize: CGSize {
        CGSize(width: view.frame.width - 40.0, height: view.frame.height - 60.0)
    }
    
    var aboutArtistCellSize: CGSize {
        CGSize(width: view.frame.width - 40.0, height: 350.0)
    }
    
    var credistsCellSize: CGSize {
        CGSize(width: view.frame.width - 40.0, height: 250.0)
    }
        
}
