//
//  AVSound.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 18/10/22.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSound() {
    guard let urlSound = Bundle.main.url(forResource: "classic-arcade-video-game", withExtension: "mp3") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)

        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: urlSound, fileTypeHint: AVFileType.mp3.rawValue)

        /* iOS 10 and earlier require the following line:
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

        guard let player = player else { return }

        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
}
