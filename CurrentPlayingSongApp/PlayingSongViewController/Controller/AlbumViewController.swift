//
//  AlbumViewController.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/23.
//

import UIKit

class AlbumViewController: UIViewController {
    
    var spotifyCurrentPlayingSong: SpotifyCurrentPlayingSong?
    var tracks: [Item] = []
    var selectedTrackIndex: Int?
    
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
        fetchData()
        fetchNews()
        
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
    
    func fetchNews() {
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7fcc5fd64d5f428aa1c7c7176527023b")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                // Write the pop to show theerror
                return
            }
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }

    
    func fetchData() {
        guard let album = JsonToSwiftConvert.convertToSwift(fileName: "AlbumTracks", model: Album.self) else {
            return
        }
        
        // Debugging prints
        print("Data successfully fetched and decoded")
        
        print("Album name: \(album.name)")
        print("Release date: \(album.releaseDate)")
    
        
        if let url = album.images?.first?.url, let imageUrl = URL(string: url) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        self.albumHeaderView.albumArtworkImageView.image = UIImage(data: data)
                        self.albumHeaderView.albumImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if let tracks = album.tracks?.items {
            self.tracks = tracks
            print("Number of tracks: \(tracks.count)")
            for track in tracks {
                print("Track name: \(track.name)")
            }
            DispatchQueue.main.async {
                self.albumTableView.reloadData()
            }
        } else {
            print("No tracks found")
        }
        
        /*
    
         guard let path = Bundle.main.path(forResource: "AlbumTracks", ofType: "json") else {
             print("Failed to find JSON file")
             return
         }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let album = try decoder.decode(Album.self, from: data)
            
            // Debugging prints
            print("Data successfully fetched and decoded")
            
            print("Album name: \(album.name)")
            print("Release date: \(album.releaseDate)")
        
            
            if let url = album.images?.first?.url, let imageUrl = URL(string: url) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: imageUrl) {
                        DispatchQueue.main.async {
                            self.albumHeaderView.albumArtworkImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
            
            if let tracks = album.tracks?.items {
                self.tracks = tracks
                print("Number of tracks: \(tracks.count)")
                for track in tracks {
                    print("Track name: \(track.name)")
                }
                DispatchQueue.main.async {
                    self.albumTableView.reloadData()
                }
            } else {
                print("No tracks found")
            }
        } catch {
            print("Failed to fetch data: \(error)")
        }
        */
    }
}






