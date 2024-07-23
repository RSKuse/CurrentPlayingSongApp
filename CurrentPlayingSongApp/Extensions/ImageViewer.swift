//
//  ImageViewer.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/05.
//

import Foundation

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async {
            print("Downloading image from URL: \(url)") // Debug print
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    print("Image successfully downloaded and set.") // Debug print
                    self.image = image
                }
            } else {
                print("Failed to download image.") // Debug print
            }
        }
    }
}
