//
//  CurrentPlayingSongViewController.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/25.
//

import UIKit

class CurrentPlayingSongViewController: UIViewController {
    var timer: Timer?
    var remainingTime: Int?
    var songDuration: Int? // Declare songDuration property
    
    var selectedDevice: Device? {
        didSet {
            guard let selectedDevice = selectedDevice else { return }
            updateSelectedDeviceUI(selectedDevice: selectedDevice)
        }
    }
    
    var isPlaying: Bool?
    var isShuffling = true
    var isAdded = false
    var devices: [Device]?
    
    lazy var albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SpotifyImages.albumCoverImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var songTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "Nancy Wilson, Cannonball Adderley"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
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
    
    lazy var shuffleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.shuffleButton, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(shuffleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.playPauseButton, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.previousButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.nextButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var shufflePlayRewindStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shuffleButton, previousButton, playPauseButton, nextButton])
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.addButton, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.timerButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.shareButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var durationSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .lightGray
        //slider.setThumbImage(UIImage(), for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "0:00"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0:00"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var deviceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.deviceButton, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(deviceButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var playlistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Its A Rap Beef"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var downArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.downArrowButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var deviceTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var moreOptionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SpotifyImages.moreOptionsButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupUI()
        fetchDataFromInternet()
        //        NotificationCenter.default.addObserver(self, selector: #selector(deviceSelected(_:)), name: NSNotification.Name("DeviceSelected"), object: nil)
    }
    
    func fetchDataFromInternet() {
        // startLoader()
        guard let playingSong = JsonToSwiftConvert.convertToSwift(),
              let item = playingSong.item,
              let artists = item.artists else {
            // showFailure()
            return
        }
        
        // stopLoader()
        displaySongArtists(artists: artists)
        devices = playingSong.devices
        updateUIFromCurrentPlayingSong(song: playingSong)
        self.selectedDevice = playingSong.device
    }
    
    func updateUIFromCurrentPlayingSong(song: SpotifyCurrentPlayingSong) {
        if let songIsPlaying = song.isPlaying {
            self.isPlaying = songIsPlaying
            songTitleLabel.text = song.item?.album?.name
            let buttonImage = songIsPlaying ? UIImage(named: "pause_icon") : SpotifyImages.playPauseButton
            playPauseButton.setImage(buttonImage, for: .normal)
        }
        
        if let album = song.item?.album, let url = album.images?.first?.url, let imageUrl = URL(string: url) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        self.albumCoverImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if let durationMS = song.item?.durationMS {
            songDuration = durationMS / 1000
            remainingTime = songDuration
            let minutes = songDuration! / 60
            let seconds = songDuration! % 60
            durationLabel.text = String(format: "%02d:%02d", minutes, seconds)
            currentTimeLabel.text = "00:00" // Set initial current time to 00:00
            durationSlider.maximumValue = Float(songDuration!)
            durationSlider.value = 0
            print("Initial remaining time: \(remainingTime!) seconds") // Debug statement
        } else {
            print("durationMS is nil")
        }
    }
    
    func displaySongArtists(artists: [ItemArtist]) {
        var artistNamesArray: [String] = []
        for artistData in artists {
            if let artistName = artistData.name {
                artistNamesArray.append(artistName)
            }
        }
        artistLabel.text = artistNamesArray.joined(separator: ", ")
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
            return
        }
        
        self.remainingTime! -= 1
        
        let elapsedSeconds = songDuration! - self.remainingTime!
        let elapsedMinutes = elapsedSeconds / 60
        let elapsedRemainingSeconds = elapsedSeconds % 60
        currentTimeLabel.text = String(format: "%02d:%02d", elapsedMinutes, elapsedRemainingSeconds)
        
        let remainingMinutes = self.remainingTime! / 60
        let remainingSeconds = self.remainingTime! % 60
        durationLabel.text = String(format: "-%02d:%02d", remainingMinutes, remainingSeconds)
        
        durationSlider.value = Float(elapsedSeconds)
        
        print("Updated remaining time: \(self.remainingTime!) seconds") // Debug statement
    }
    
    @objc func playPauseButtonTapped() {
        guard let isPlaying = self.isPlaying else { return }
        
        self.isPlaying = !isPlaying
        
        print("Play/Pause button tapped. Is playing: \(self.isPlaying!)") // Debug statement
        
        if self.isPlaying! {
            if remainingTime == 0 {
                remainingTime = songDuration // Reset remaining time to song duration
                let minutes = remainingTime! / 60
                let seconds = remainingTime! % 60
                durationLabel.text = String(format: "%02d:%02d", minutes, seconds)
            }
            startTimer()
            print("Timer started with remaining time: \(remainingTime!) seconds") // Debug statement
        } else {
            stopTimer()
            print("Timer stopped") // Debug statement
        }
        
        let buttonImage = self.isPlaying! ? UIImage(named: "pause_icon") : SpotifyImages.playPauseButton
        playPauseButton.setImage(buttonImage, for: .normal)
    }
    
    
    
    
    
    @objc func shuffleButtonTapped() {
        isShuffling = !isShuffling
        let spotifyGreen = SpotifyColors.spotifyGreen
        shuffleButton.tintColor = isShuffling ? spotifyGreen : .white
    }
    
    @objc func addButtonTapped() {
        let spotifyGreen = SpotifyColors.spotifyGreen
        isAdded.toggle()
        if isAdded {
            addButton.setImage(SpotifyImages.pauseButton, for: .normal)
            addButton.tintColor = spotifyGreen
        } else {
            addButton.setImage(SpotifyImages.addButton, for: .normal)
            addButton.tintColor = .white
        }
    }
    
    func updateSelectedDeviceUI(selectedDevice: Device) {
        
        if let deviceImage = UIImage(named: selectedDevice.iconName) {
            deviceButton.setImage(deviceImage, for: .normal)
        } else {
            print("Image \(selectedDevice.iconName) not found")
        }
        playlistLabel.text = "Current device: \(selectedDevice.name ?? "Unknown Device")"
        deviceTypeLabel.text = "Device Name: \(selectedDevice.name ?? "Unknown Type")"
    }
    
    @objc func deviceButtonTapped() {
        guard let devices = devices else { return }
        let deviceSelectionVC = DeviceSelectionViewController(devices: devices)
        deviceSelectionVC.didSelectDevice = { selectedDevice in
            self.selectedDevice = selectedDevice
        }
        present(deviceSelectionVC, animated: true, completion: nil)
    }
    
}

extension CurrentPlayingSongViewController {
    func setupUI() {
        
        view.addSubview(albumCoverImageView)
        view.addSubview(songAndArtistTitleStackView)
        view.addSubview(playPauseButton)
        view.addSubview(shuffleButton)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        view.addSubview(shufflePlayRewindStackView)
        view.addSubview(durationSlider)
        view.addSubview(currentTimeLabel)
        view.addSubview(durationLabel)
        view.addSubview(addButton)
        view.addSubview(deviceButton)
        view.addSubview(playlistLabel)
        view.addSubview(downArrowButton)
        view.addSubview(moreOptionsButton)
        view.addSubview(timerButton)
        view.addSubview(shareButton)
        view.addSubview(deviceTypeLabel)
        
        downArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        downArrowButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        downArrowButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        downArrowButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        playlistLabel.centerYAnchor.constraint(equalTo: downArrowButton.centerYAnchor).isActive = true
        playlistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        moreOptionsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        moreOptionsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        moreOptionsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        moreOptionsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        albumCoverImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        albumCoverImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        albumCoverImageView.topAnchor.constraint(equalTo: downArrowButton.bottomAnchor, constant: 35).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        songAndArtistTitleStackView.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 40).isActive = true
        songAndArtistTitleStackView.leftAnchor.constraint(equalTo: durationSlider.leftAnchor).isActive = true
        
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addButton.centerYAnchor.constraint(equalTo: songAndArtistTitleStackView.centerYAnchor).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        durationSlider.topAnchor.constraint(equalTo: songAndArtistTitleStackView.bottomAnchor, constant: 20).isActive = true
        durationSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        durationSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        currentTimeLabel.leftAnchor.constraint(equalTo: durationSlider.leftAnchor).isActive = true
        currentTimeLabel.topAnchor.constraint(equalTo: durationSlider.bottomAnchor, constant: 2).isActive = true
        
        durationLabel.rightAnchor.constraint(equalTo: durationSlider.rightAnchor).isActive = true
        durationLabel.topAnchor.constraint(equalTo: durationSlider.bottomAnchor, constant: 2).isActive = true
        
        shufflePlayRewindStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        shufflePlayRewindStackView.topAnchor.constraint(equalTo: currentTimeLabel.bottomAnchor, constant: 20).isActive = true
        
        timerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        timerButton.centerYAnchor.constraint(equalTo: shufflePlayRewindStackView.centerYAnchor).isActive = true
        timerButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        timerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        shuffleButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        shuffleButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        previousButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        playPauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nextButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        deviceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        deviceButton.topAnchor.constraint(equalTo: shufflePlayRewindStackView.bottomAnchor, constant: 20).isActive = true
        deviceButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        deviceButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        shareButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        shareButton.topAnchor.constraint(equalTo: timerButton.bottomAnchor, constant: 20).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        deviceTypeLabel.topAnchor.constraint(equalTo: deviceButton.bottomAnchor, constant: 10).isActive = true
        deviceTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
