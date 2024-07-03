//
//  DeviceSelectionViewController.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/06/25.
//

import Foundation
import UIKit

class DeviceSelectionViewController: UIViewController {

    var devices: [Device] = []
    var didSelectDevice: ((Device) -> Void)?
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Current device"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentDeviceLabel: UILabel = {
        let label = UILabel()
        label.text = "This iPhone"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var deviceIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iphone_icon")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var allowAccessButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Allow access", for: .normal)
        button.backgroundColor = SpotifyColors.spotifyGreen
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var airPlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("AirPlay or Bluetooth", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var devicesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: DeviceTableViewCell.cellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        return tableView
    }()
    
    init(devices: [Device]) {
        self.devices = devices
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        registerCell()
    }
    
    func setupUI() {
        view.addSubview(headerLabel)
        view.addSubview(currentDeviceLabel)
        view.addSubview(deviceIconImageView)
        view.addSubview(allowAccessButton)
        view.addSubview(airPlayButton)
        view.addSubview(devicesTableView)
        
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        deviceIconImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        deviceIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deviceIconImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        deviceIconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        currentDeviceLabel.topAnchor.constraint(equalTo: deviceIconImageView.bottomAnchor, constant: 10).isActive = true
        currentDeviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        devicesTableView.topAnchor.constraint(equalTo: currentDeviceLabel.bottomAnchor, constant: 20).isActive = true
        devicesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        devicesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        devicesTableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        allowAccessButton.topAnchor.constraint(equalTo: devicesTableView.bottomAnchor, constant: 20).isActive = true
        allowAccessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        allowAccessButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        allowAccessButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        airPlayButton.topAnchor.constraint(equalTo: allowAccessButton.bottomAnchor, constant: 20).isActive = true
        airPlayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func registerCell() {
        devicesTableView.register(DeviceTableViewCell.self, forCellReuseIdentifier: DeviceTableViewCell.cellID) // zzz: This was registered in line 63
    }
    
}
