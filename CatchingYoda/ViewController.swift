//
//  ViewController.swift
//  CatchingYoda
//
//  Created by Kursat Coskun on 5.05.2018.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PlayNowImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.PlayNow))
        PlayNowImage.isUserInteractionEnabled = true
        PlayNowImage.addGestureRecognizer(recognizer1)
        
    }
    @objc func PlayNow(){
        performSegue(withIdentifier: "firstToPlay", sender: nil)
    }

   


}

