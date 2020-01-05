//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Hari Prasad on 1/3/20.
//  Copyright © 2020 Hari Prasad. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
         
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    //MARK: Playing the sound when button is pressed
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
        
    }
    
    //MARK: Stopping the audio when stop button pressed
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

}
