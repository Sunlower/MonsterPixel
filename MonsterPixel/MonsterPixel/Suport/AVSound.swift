//
//  AVSound.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 18/10/22.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

// MARK: Extensão para adicionar música

private var players = [URL:AVAudioPlayer]()
private var duplicatePlayers = [AVAudioPlayer]()

func playSound(name: String, exten: String) {
    guard let soundUrl = Bundle.main.url(forResource: name, withExtension: exten)
    else {
        return
    }

    if let player = players[soundUrl] {
        if !player.isPlaying {
            player.prepareToPlay()
            player.play()
            return
        }
        createADuplicatedPlayer()
        return
    }

    createANewPlayer()

    func createANewPlayer() {
        do{
            let player = try AVAudioPlayer(contentsOf: soundUrl)
            players[soundUrl] = player
            player.prepareToPlay()
            player.play()
        } catch {
            print("Could not play sound file!")
        }
    }

    func createADuplicatedPlayer() {
        let newPlayer = try! AVAudioPlayer(contentsOf: soundUrl)
        duplicatePlayers.append(newPlayer)
        newPlayer.prepareToPlay()
        newPlayer.play()
    }

}
