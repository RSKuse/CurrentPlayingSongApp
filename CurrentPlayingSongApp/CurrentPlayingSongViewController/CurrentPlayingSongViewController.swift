//
//  CurrentPlayingSongViewController.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/25.
//  Created by Reuben Simphiwe Kuse on 2024/06/20.
//

import UIKit

class CurrentPlayingSongViewController: UIViewController {
    var timer: Timer?
    var remainingTime: Int?
    var songDuration: Int?
    
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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var songCollectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
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
        label.text = "..."
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
    
    lazy var artistInfoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About the artist"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var listenersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .lightGray
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false // This is important for UITextView inside a scrollable container
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    lazy var followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupUI()
        fetchDataFromInternet()
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
    
    func displaySongArtists(artists: [Artist]) {
        var artistNamesArray: [String] = []
        for artistData in artists {
            if let artistName = artistData.name {
                artistNamesArray.append(artistName)
                // For the first artist, update the artist info section
                if artistNamesArray.count == 1 {
                    artistNameLabel.text = artistName
                    if let followers = artistData.followers?.total {
                        listenersLabel.text = "\(followers.formattedWithSuffix) monthly listeners"
                    } else {
                        listenersLabel.text = "No listeners data"
                    }
                    if let description = artistData.description {
                        artistDescriptionTextView.text = description
                        print("Artist Description: \(description)") // Debug print to check if description is available
                    } else {
                        artistDescriptionTextView.text = "No description available"
                        print("No description available for \(artistName)") // Debug print to check if description is missing
                    }
                    
                    if let artistImageUrl = artistData.images?.first?.url, let imageUrl = URL(string: artistImageUrl) {
                        DispatchQueue.global().async {
                            if let data = try? Data(contentsOf: imageUrl) {
                                DispatchQueue.main.async {
                                    self.artistImageView.image = UIImage(data: data)
                                }
                            }
                        }
                    }
                }
            }
        }
        artistLabel.text = artistNamesArray.joined(separator: ", ")
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
    
    @objc func followButtonTapped() {
        if followButton.title(for: .normal) == "Follow" {
            followButton.setTitle("Following", for: .normal)
        } else {
            followButton.setTitle("Follow", for: .normal)
        }
        
    }
    
    func updateSelectedDeviceUI(selectedDevice: Device) {
        
        if let deviceImage = UIImage(named: selectedDevice.iconName) {
            deviceButton.setImage(deviceImage, for: .normal)
            deviceButton.tintColor = SpotifyColors.spotifyGreen
        } else {
            print("Image \(selectedDevice.iconName) not found")
        }
        playlistLabel.text = "\(selectedDevice.name ?? "Unknown Device")"
        deviceTypeLabel.text = "\(selectedDevice.name ?? "Unknown Type")"
        deviceTypeLabel.textColor = SpotifyColors.spotifyGreen
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


