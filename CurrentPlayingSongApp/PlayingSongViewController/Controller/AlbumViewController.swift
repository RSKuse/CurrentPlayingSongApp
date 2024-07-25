//
//  AlbumViewController.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//

import Foundation
import UIKit

class AlbumViewController: UIViewController {
    
    lazy var albumTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var albumHeaderView: AlbumHeaderView = {
        let headerView = AlbumHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 550))
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        configureHeaderView()
        registerCell()
    }
    
    func setupUI() {
        view.addSubview(albumTableView)
        
        albumTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        albumTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        albumTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func registerCell() {
        albumTableView.register(SongCell.self, forCellReuseIdentifier: SongCell.cellID)
    }
    
    func sizeHeaderToFit() {
        albumHeaderView.setNeedsLayout()
        albumHeaderView.layoutIfNeeded()
        albumHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 550)
    }
    
    func configureHeaderView() {
        albumHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 550)
        albumTableView.tableHeaderView = albumHeaderView
    }
}





