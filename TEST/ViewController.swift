//
//  ViewController.swift
//  TEST
//
//  Created by Davit on 10/6/7512 ERA0.
//  Copyright © 7512 ERA0 Davit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var constraintX: NSLayoutConstraint!
    @IBOutlet weak var constraintY: NSLayoutConstraint!
    var X: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        X = constraintY.constant
    }

    @IBAction func button(_ sender: Any) {
        cikl(position: .bottomRight)
    }
    func cikl(position: Position) {
    var pos = position
    changePosition(pos: pos)
        
        UIView.animate(withDuration: 2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
         }) { (finished) in
                   if finished {
                       pos.next()
                       self.cikl(position: pos)
    }
    
    
}

}
    func changePosition(pos: Position) {
        switch pos {
        case .bottomLeft:
            self.constraintY.constant = 180
            self.constraintX.constant = 55
        case .bottomRight:
            self.constraintY.constant = 180
            self.constraintX.constant = 250
        case .topRight:
            self.constraintY.constant = 58
            self.constraintX.constant = 250
        case .topLeft:
            self.constraintY.constant = 58
            self.constraintX.constant = 55
        }
    }
    
    
    }

enum Position: Int, CaseIterable {
    case topLeft
    case bottomLeft
    case bottomRight
    case topRight
    
    mutating func next() {
        let allCases = type(of: self).allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
    }
}
