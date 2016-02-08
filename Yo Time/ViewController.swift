//
//  ViewController.swift
//  Yo Time
//
//  Created by Justinas Alisauskas on 26/01/2016.
//  Copyright © 2016 JustInCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timerRunning = false
    
    //var hrs = 0
    //var min = 0
    //var sec = 0
    var time = 0
    
    var timer = NSTimer() //NS - next step
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBAction func resetButton(sender: AnyObject) {
        //stop timer
        timer.invalidate()
        timerRunning = false
        time = 0
        timeLabel.text = String(time) + "s."
    }
    
    @IBAction func startButton(sender: AnyObject) {
        //start timer
        if !timerRunning{
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)//1 - 1 second, target - self(because why not..), selector - result(means that it launches function"result", userinfo - nil(we dont use it), repeats - true(because we want it to loop)
            timerRunning = true
        }
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        timer.invalidate()
        timerRunning = false
    }
    
    func result(){
        time++
        if time >= 3600{
            timeLabel.text = String(time/3600) + "h. " + String((time%3600)/60) + "min. " + String(time%60) + "s."
        }else if time >= 60{
            timeLabel.text = String((time%3600)/60) + "min. " + String(time%60) + "s."
        }else{
            timeLabel.text = String(time) + "s."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(time) + "s. "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

