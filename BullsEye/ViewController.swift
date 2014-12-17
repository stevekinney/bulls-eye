//
//  ViewController.swift
//  BullsEye
//
//  Created by Steve Kinney on 12/17/14.
//  Copyright (c) 2014 Steve Kinney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var currentRound: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score = score + points
        
        let message = "The value of the slider is \(currentValue)."
                        + "\nThe target value is \(targetValue)."
                        + "\nThe difference is \(difference)."
                        + "\nYou scored \(points) points."
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Right On", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        currentRound++
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(currentRound)
        scoreLabel.text = String(score)
    }

}

