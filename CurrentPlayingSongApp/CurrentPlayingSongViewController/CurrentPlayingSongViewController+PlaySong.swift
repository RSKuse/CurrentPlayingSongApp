//
//  CurrentPlayingSongViewController+PlaySong.swift
//  CurrentPlayingSongApp
//
//  Created by Gugulethu Mhlanga on 2024/07/02.
//

import Foundation
import UIKit

extension CurrentPlayingSongViewController {
    
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
    
}
