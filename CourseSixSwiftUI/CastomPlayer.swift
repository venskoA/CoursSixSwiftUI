//
//  CastomPlayer.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 22.05.22.
//

import Foundation
import AVFoundation

// MARK: Player

class CastomPlayer: ObservableObject {
    @Published public var maxDuration: Double = 0.0
    private var player: AVAudioPlayer? = nil
    var duration = 0.0

    public func play(_ name: String) {
        playerName(name)
        player?.play()
//        pushTime()
    }

    public func stop() {
        player?.stop()
//        pushTime()
    }

    public func setTime(time: Float) {
        guard let time = TimeInterval(exactly: time) else { return }
        player?.currentTime = time
        player?.play()
    }

    private func playerName(_ name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error)
        }

    }
}
