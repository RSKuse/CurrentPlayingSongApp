//
//  Extensions.swift
//  CurrentPlayingSongApp
//
//  Created by Reuben Simphiwe Kuse on 2024/07/02.
//

import Foundation
import UIKit

extension Int {
    var formattedWithSuffix: String {
        if self >= 1_000_000_000 {
            return String(format: "%.1fB", Double(self) / 1_000_000_000).replacingOccurrences(of: ".0", with: "")
        } else if self >= 1_000_000 {
            return String(format: "%.1fM", Double(self) / 1_000_000).replacingOccurrences(of: ".0", with: "")
        } else if self >= 1_000 {
            return String(format: "%.1fK", Double(self) / 1_000).replacingOccurrences(of: ".0", with: "")
        } else {
            return String(self)
        }
    }
}
