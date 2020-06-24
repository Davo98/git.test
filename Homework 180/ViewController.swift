//
//  ViewController.swift
//  Homework 180
//
//  Created by Davit on 10/12/7512 ERA0.
//  Copyright © 7512 ERA0 Davit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var constraintX: NSLayoutConstraint!
    @IBOutlet weak var constraintY: NSLayoutConstraint!
    var stepCount: Double = 100
    var curentStep: Double = 0
    let r: Double = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        initTimer()
        
    }
    func initTimer () {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            self.changePosition()
        })
    }
    
    func changePosition() {
        curentStep += 1
        var curentAngel = 360 / stepCount * curentStep
        
        let mn = Int(curentAngel) % 360
        if mn > 180 {
            curentAngel = Double(360 - mn)
        }
        let sinus = sin(curentAngel * Double.pi / 180)
        let cosinus = cos(curentAngel * Double.pi / 180)
        let x = r - cosinus * r
        let y = sinus * r
        
        constraintX.constant = CGFloat(x)
        constraintY.constant = CGFloat(y)
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }

}

