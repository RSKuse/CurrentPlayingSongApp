//
//   HorizontalCollectionViewCell.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/10.
//

import Foundation
import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HorizontalCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
