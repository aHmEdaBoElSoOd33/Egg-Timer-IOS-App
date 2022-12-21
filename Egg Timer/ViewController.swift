//
//  ViewController.swift
//  Egg Timer
//
//  Created by Muhamed Alkhatib on 21/08/2020.
//

import UIKit
 
class ViewController: UIViewController {

    @IBOutlet weak var timeRemaining: UILabel!
    @IBOutlet weak var eggImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var timeOut: UILabel!
    
    var counter : Int = 3
    var timer: Timer?
    var seconds : Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        progressView.progress = 0.0
        
    }

    
    @objc func action () {
        if counter > 0 {
            print(counter)
            counter -= 1
            var remaningSeconds = counter-(counter/60*60)
            if remaningSeconds < 10 {
                timeRemaining.text = "Time Remaining = \(counter/60) : 0\(remaningSeconds) "
            }else{
                timeRemaining.text = "Time Remaining = \(counter/60) : \(remaningSeconds) "
            }
            
            
            progressView.progress = 1.0 - Float(counter)/Float(seconds)
            
        }else{
            timeOut.text = "Time out , Bon Appetit"
            timeRemaining.text = ""
            timer?.invalidate()
        }
    }
    
    
    @IBAction func cokkingSegmant(_ sender: Any) {
       
        timer?.invalidate()
        
        timeRemaining.text = ""
        timeOut.text = ""
        switch (sender as AnyObject).selectedSegmentIndex{
        case 0 : eggImage.image = UIImage(named: "Soft")
                 counter = 3
        case 1 : eggImage.image = UIImage(named: "Medium")
                 counter = 5
        case 2 : eggImage.image = UIImage(named: "hard")
                 counter = 8
        default : print("error")
       
        }
        seconds = counter
        progressView.progress = 0.0
        print(counter)
        
    }
    
    
    @IBAction func startCoking(_ sender: Any) {
        print("start")
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    
}

