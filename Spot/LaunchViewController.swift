//
//  LaunchViewController.swift
//  Spot
//
//  Created by Chitralekha Yellewar on 18/08/18.
//  Copyright © 2018 Chitralekha Yellewar. All rights reserved.
//

import UIKit

public let animateDuration = 5.0

class LaunchViewController: UIViewController {

    @IBOutlet weak var spotNameLabel: UILabel!    
    @IBOutlet weak var spotBottomContraint: NSLayoutConstraint!
    @IBOutlet weak var sportDescLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spotNameLabel.alpha = .zeroAlpha
        self.sportDescLabel.alpha = .zeroAlpha
        animatespotNameLabel()
    }
    
    func animatespotNameLabel() -> Void {
        UIView.transition(with: self.spotNameLabel, duration: animateDuration, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.spotNameLabel.alpha = .oneAplha
            self.spotBottomContraint.constant = self.view.frame.height*CGFloat.labelBottomMutliplier
            self.view.layoutIfNeeded()
        }, completion: { (finished) in
            self.animatesportDescLabel()
        })
    }
    
    func animatesportDescLabel() -> Void {
        UIView.animate(withDuration: animateDuration, animations: {
            self.sportDescLabel.alpha = .oneAplha
            self.view.layoutIfNeeded()
            print("Animation Done")
        }, completion: { (finished) in
            self.performSegue(withIdentifier: "SHOW_MAP_SEGUE", sender: self)
        })
    }
}

extension CGFloat {
    public static let zeroAlpha = CGFloat(0.0)
    public static let oneAplha = CGFloat(1.0)
    public static let labelBottomMutliplier = CGFloat(0.55)
}


