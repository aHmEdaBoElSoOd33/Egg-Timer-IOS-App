//
//  ViewController.swift
//  Egg Timer
//
//  Created by Muhamed Alkhatib on 21/08/2020.
//

import UIKit
import ImageIO
class ViewController: UIViewController {

    @IBOutlet weak var eggImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var timeOut: UILabel!
    
    var counter : Int = 3
    var timer: Timer?
    var seconds : Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeOut.isHidden = true
        progressView.progress = 0.0
        // Do any additional setup after loading the view.
    }

    
    @objc func action () {
        if counter > 0 {
            print(counter)
            counter -= 1
            
            progressView.progress = 1.0 - Float(counter)/Float(seconds)
            
        }else{
            timeOut.isHidden = false
            timer?.invalidate()
        }
    }
    
    
    @IBAction func cokkingSegmant(_ sender: Any) {
       
        timer?.invalidate()
        
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
        timeOut.isHidden = true
    }
    
    
    @IBAction func startCoking(_ sender: Any) {
        print("start")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    
}

