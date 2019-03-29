//
//  GameViewController.swift
//  FlappyDragon
//
//  Created by Gabriel Carvalho Guerrero on 28/03/19.
//  Copyright © 2019 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var stage: SKView!
    var musicPlayer: AVAudioPlayer!
    
    func presentScene(){
        let scene = GameScene(size: CGSize(width: 320, height: 568))
        scene.gameViewController = self
        scene.scaleMode = .aspectFill
        stage.presentScene(scene, transition: .doorsOpenVertical(withDuration: 0.5))
    }
    
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "m4a") {
            musicPlayer = try! AVAudioPlayer(contentsOf: musicURL)
            musicPlayer.numberOfLoops = -1
            musicPlayer.volume = 0.2
            musicPlayer.play()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stage = view as! SKView
        stage.ignoresSiblingOrder = true
        
        presentScene()
        playMusic()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
