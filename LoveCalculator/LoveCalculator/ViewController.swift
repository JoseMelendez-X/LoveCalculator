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
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var compatibilityLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
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
        } else {
            
            playSound(fileToPlay: soundFiles[1])
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

