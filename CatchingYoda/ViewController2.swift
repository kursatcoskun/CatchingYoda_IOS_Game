//
//  ViewController2.swift
//  CatchingYoda
//
//  Created by Kursat Coskun on 5.05.2018.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var yoda1: UIImageView!
    @IBOutlet weak var yoda2: UIImageView!
    @IBOutlet weak var yoda3: UIImageView!
    @IBOutlet weak var yoda4: UIImageView!
    @IBOutlet weak var yoda5: UIImageView!
    @IBOutlet weak var yoda6: UIImageView!
    @IBOutlet weak var yoda7: UIImageView!
    @IBOutlet weak var yoda8: UIImageView!
    @IBOutlet weak var yoda9: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var BackImage: UIImageView!
    
    var yodaArray = [UIImageView]()
    var score = 0
    var timer = Timer()
    var counter = 0
    var hideTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        BackImage.alpha = 0.75
        
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        if highScore == nil {
            highScoreLabel.text = "0"
        }
        if let newScore = highScore as? Int {
            highScoreLabel.text = String(newScore)
        }
        
        scoreLabel.text = "Score: \(score)"
        
        let rec1 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec2 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec3 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec4 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec5 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec6 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec7 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec8 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        let rec9 = UITapGestureRecognizer(target: self, action: #selector(ViewController2.increaseScore))
        
        yoda1.isUserInteractionEnabled = true
        yoda2.isUserInteractionEnabled = true
        yoda3.isUserInteractionEnabled = true
        yoda4.isUserInteractionEnabled = true
        yoda5.isUserInteractionEnabled = true
        yoda6.isUserInteractionEnabled = true
        yoda7.isUserInteractionEnabled = true
        yoda8.isUserInteractionEnabled = true
        yoda9.isUserInteractionEnabled = true
        
        yoda1.addGestureRecognizer(rec1)
        yoda2.addGestureRecognizer(rec2)
        yoda3.addGestureRecognizer(rec3)
        yoda4.addGestureRecognizer(rec4)
        yoda5.addGestureRecognizer(rec5)
        yoda6.addGestureRecognizer(rec6)
        yoda7.addGestureRecognizer(rec7)
        yoda8.addGestureRecognizer(rec8)
        yoda9.addGestureRecognizer(rec9)
        
        
        //timers
        counter = 30
        timerLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController2.HideYoda), userInfo: nil, repeats: true)
        
        
        
        //arrays
        
        yodaArray.append(yoda1)
        yodaArray.append(yoda2)
        yodaArray.append(yoda3)
        yodaArray.append(yoda4)
        yodaArray.append(yoda5)
        yodaArray.append(yoda6)
        yodaArray.append(yoda7)
        yodaArray.append(yoda8)
        yodaArray.append(yoda9)
        
        HideYoda()
        
        
    }
    
    
    @objc func HideYoda() {
        for yoda in yodaArray {
            yoda.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(yodaArray.count - 1)))
        yodaArray[random].isHidden = false
    }
    
    @objc func countDown() {
        
        counter = counter - 1
        timerLabel.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            
            if self.score > Int(highScoreLabel.text!)! {
                
                UserDefaults.standard.set(self.score, forKey: "highscore")
                highScoreLabel.text = String(self.score)
                
            }
            
            
            let alert = UIAlertController(title: "Time", message: "Time's Up", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                self.timerLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController2.HideYoda), userInfo: nil, repeats: true)
                
            })
            
            alert.addAction(replayButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
        
    }

    @objc func increaseScore() {
        score = score + 1
        scoreLabel.text = "Score: \(score)"
        
    }

}
