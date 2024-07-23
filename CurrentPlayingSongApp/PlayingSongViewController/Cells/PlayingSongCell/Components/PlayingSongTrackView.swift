//
//  PlayingSongTrackView.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/03.
//

import Foundation
import UIKit

class PlayingSongSliderView: UIView {
    
    lazy var durationSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .lightGray
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0:00"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0:00"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupUI()
    }
    
    func setupUI() {
        addSubview(durationSlider)
        addSubview(currentTimeLabel)
        addSubview(durationLabel)
        
        durationSlider.topAnchor.constraint(equalTo: topAnchor).isActive = true
        durationSlider.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        durationSlider.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        currentTimeLabel.leftAnchor.constraint(equalTo: durationSlider.leftAnchor).isActive = true
        currentTimeLabel.topAnchor.constraint(equalTo: durationSlider.bottomAnchor, constant: 2).isActive = true
        
        durationLabel.rightAnchor.constraint(equalTo: durationSlider.rightAnchor).isActive = true
        durationLabel.topAnchor.constraint(equalTo: durationSlider.bottomAnchor, constant: 2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSlider(elapsedTime: Int, totalDuration: Int) {
        let progress = Float(elapsedTime) / Float(totalDuration)
        durationSlider.value = progress
        let elapsedMinutes = elapsedTime / 60
        let elapsedRemainingSeconds = elapsedTime % 60
        currentTimeLabel.text = String(format: "%02d:%02d", elapsedMinutes, elapsedRemainingSeconds)
        
        let remainingTime = totalDuration - elapsedTime
        let remainingMinutes = remainingTime / 60
        let remainingSeconds = remainingTime % 60
        durationLabel.text = String(format: "-%02d:%02d", remainingMinutes, remainingSeconds)
    }
}


