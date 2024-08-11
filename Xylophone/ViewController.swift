//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // sound


class ViewController: UIViewController {
    
    var AudioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func KeyPressed(_ sender: UIButton) {
        
        PlaySound(soundName: sender.currentTitle!)
        
    
        sender.alpha = 0.5
        // Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
            
            
            
        }
        
        func PlaySound(soundName :String) {
            guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else
            { return }
            
            do {
                try
                AudioPlayer = AVAudioPlayer(contentsOf: url)
                AudioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
        
        
        
    }
    
}
