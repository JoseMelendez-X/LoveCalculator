//
//  ViewController.swift
//  LoveCalculator
//
//  Created by Jose Melendez on 9/19/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
   var audioPlayer: AVAudioPlayer!
    
    //IB - Outlets
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var compatibilityLabel: UILabel!
    
    let soundFiles = ["uh", "happy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //IB - Actions
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        calculate()
        
        
    }
    
    
    
    
    //Calculation
    func calculate() {
        
        let lovePercent = arc4random_uniform(101)
        
        if textField1.text != "" && textField2.text != ""{
            
            compatibilityLabel.text = "\(lovePercent)%"
            
        }
        
        if lovePercent < 80 {
            
            playSound(fileToPlay: soundFiles[0])
            
            summaryLabel.text = "A successful relationship is possible, but you both have to work on it. Do not sit back and think that it will all work out fine, because it might not be working out the way you wanted it to. Spend as much time with each other as possible. Again, the chance of this relationship working out is very small, so even when you do work hard on it, it still might not work out."
            
        } else {
            
            playSound(fileToPlay: soundFiles[1])
            
            summaryLabel.text = "very good chance of being successful, but this doesn't mean that you don't have to work on the relationship. Remember that every relationship needs spending time together, talking with each other etc."
        }
        
    }
    
    //Play sound
    func playSound(fileToPlay: String) {
        
        let sourceFile = Bundle.main.url(forResource: fileToPlay , withExtension: "wav")!
        
        do {
            try  audioPlayer = AVAudioPlayer(contentsOf: sourceFile)
            
        } catch {
            
            print(error)
        }
        
        audioPlayer.play()
        
    }
    
    //Exit the keyboard once the user has touch the text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
  
}

