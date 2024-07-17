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
    var timer: Timer?
    var remainingTime: Int?
    var songDuration: Int?
    var isPlaying: Bool = false
    var devices: [Device] = []
    
    var selectedDevice: Device? {
        didSet {
            guard let selectedDevice = selectedDevice else { return }
            updateSelectedDeviceUI(selectedDevice: selectedDevice)
        }
    }
    
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
        if let durationMS = currentlyPlayingSong?.item?.durationMS {
            songDuration = durationMS / 1000 // Convert to seconds
            remainingTime = songDuration
        }
        if let devices = currentlyPlayingSong?.devices {
            self.devices = devices
        }
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
    
    func playPauseButtonTapped() {
        if !isPlaying && remainingTime == 0 {
            remainingTime = songDuration
            updateLabelsAndSlider(elapsedSeconds: 0)
        }
        isPlaying.toggle()
        
        if isPlaying {
            startTimer()
        } else {
            stopTimer()
        }
        
        // Update play/pause button image in the playing song cell
        if let playingSongCell = playingSongCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? PlayingSongCell {
            let buttonImage = isPlaying ? UIImage(named: "pause_icon") : SpotifyImages.playPauseButton
            playingSongCell.songControlsView.playPauseButton.setImage(buttonImage, for: .normal)
        }
    }
    
    func startTimer() {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer() {
        guard let remainingTime = remainingTime, remainingTime > 0 else {
            stopTimer()
            isPlaying = false
            // Update play/pause button image in the playing song cell
            if let playingSongCell = playingSongCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? PlayingSongCell {
                let buttonImage = SpotifyImages.playPauseButton
                playingSongCell.songControlsView.playPauseButton.setImage(buttonImage, for: .normal)
            }
            return
        }
        self.remainingTime! -= 1
        let elapsedSeconds = songDuration! - self.remainingTime!
        updateLabelsAndSlider(elapsedSeconds: elapsedSeconds)
    }
    
    func updateLabelsAndSlider(elapsedSeconds: Int) {
        let elapsedMinutes = elapsedSeconds / 60
        let elapsedRemainingSeconds = elapsedSeconds % 60
        let remainingMinutes = (songDuration! - elapsedSeconds) / 60
        let remainingSeconds = (songDuration! - elapsedSeconds) % 60
        
        if let playingSongCell = playingSongCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? PlayingSongCell {
            playingSongCell.playingSongSliderView.currentTimeLabel.text = String(format: "%02d:%02d", elapsedMinutes, elapsedRemainingSeconds)
            playingSongCell.playingSongSliderView.durationLabel.text = String(format: "-%02d:%02d", remainingMinutes, remainingSeconds)
            playingSongCell.playingSongSliderView.durationSlider.value = Float(elapsedSeconds)
        }
    }
    
    func deviceButtonTapped() {
        let deviceSelectionVC = DeviceSelectionViewController(devices: devices)
        deviceSelectionVC.didSelectDevice = { [weak self] selectedDevice in
            self?.selectedDevice = selectedDevice
        }
        present(deviceSelectionVC, animated: true, completion: nil)
    }
    
    func updateSelectedDeviceUI(selectedDevice: Device) {
        if let playingSongCell = playingSongCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? PlayingSongCell {
            playingSongCell.deviceControlAndShareSongView.deviceTypeLabel.text = selectedDevice.name
            playingSongCell.deviceControlAndShareSongView.deviceButton.setImage(UIImage(named: selectedDevice.iconName), for: .normal)
        }
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
