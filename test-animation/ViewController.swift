//
//  ViewController.swift
//  test-animation
//
//  Created by Kanni on 6/5/16.
//  Copyright © 2016 kanni. All rights reserved.
//

import UIKit
import Advance

class ViewController: UIViewController {

    var buttonView: UIView!
    var button: UIButton!
    
    let diameter: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonView = SpringView()
        buttonView.frame = CGRectMake(300, 300, diameter, diameter)
        buttonView.backgroundColor = UIColor.clearColor()
        buttonView.layer.borderWidth = 2.0
        buttonView.layer.borderColor = UIColor.blueColor().CGColor
        buttonView.layer.cornerRadius = buttonView.frame.size.height / 2
        view.addSubview(buttonView)
        
//        let buttonHoldRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(onButtonHold))
//        buttonHoldRecognizer.minimumPressDuration = 0.8
        let buttonHoldRecognizer = UITapGestureRecognizer(target: self, action: #selector(onButtonHold))
        buttonView.addGestureRecognizer(buttonHoldRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onButtonHold() {
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.TransitionNone, animations: {
            
                if self.buttonView.transform.d == 0.5 {
                    let transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                    self.buttonView.transform = transform
                } else {
                    let transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5)
                    self.buttonView.transform = transform
                }
            }) { (success) in
                
        }
    }
}

