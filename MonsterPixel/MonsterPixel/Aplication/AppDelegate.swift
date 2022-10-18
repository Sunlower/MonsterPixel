//
//  AppDelegate.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 10/10/22.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.

        let session = AVAudioSession.sharedInstance()
        do {
            try session.setActive(true)
            try session.setCategory(.playback, mode: .default,  options: .defaultToSpeaker)
        } catch {
            print(error.localizedDescription)
        }
        return true
    }
    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
