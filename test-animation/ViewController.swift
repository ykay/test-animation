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
    var collectionView: UICollectionView!
    
    let diameter: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.whiteColor()
        
        buttonView = SpringView()
        buttonView.frame = CGRectMake(300, 300, diameter, diameter)
        buttonView.backgroundColor = UIColor.clearColor()
        buttonView.layer.borderWidth = 2.0
        buttonView.layer.borderColor = UIColor.blueColor().CGColor
        buttonView.layer.cornerRadius = buttonView.frame.size.height / 2
        view.addSubview(buttonView)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onButtonTap))
        buttonView.addGestureRecognizer(recognizer)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        collectionView = UICollectionView(frame: CGRectMake(0, 0, 300, 100), collectionViewLayout: layout)
//        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func onButtonTap() {
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

extension ViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let today = NSDate()
        let range = NSCalendar.currentCalendar().rangeOfUnit(.Day, inUnit: .Month, forDate: today)
        let numDays = range.length
        
        let dateComponents = NSDateComponents()
        dateComponents.year = NSCalendar.currentCalendar().component(.Year, fromDate: today)
        dateComponents.month = NSCalendar.currentCalendar().component(.Month, fromDate: today)
        dateComponents.day = 1
        let firstDay = NSCalendar.currentCalendar().dateFromComponents(dateComponents)
        
        let weekdayOfFirstDay = NSCalendar.currentCalendar().component(.Weekday, fromDate: firstDay!)
        let extraPreMonthDays = 7 - (7 - (weekdayOfFirstDay - 1))
        
        let lastDayComponents = NSDateComponents()
        lastDayComponents.year = NSCalendar.currentCalendar().component(.Year, fromDate: today)
        lastDayComponents.month = NSCalendar.currentCalendar().component(.Month, fromDate: today)
        lastDayComponents.day = numDays
        let lastDay = NSCalendar.currentCalendar().dateFromComponents(lastDayComponents)
        
        let weekdayOfLastDay = NSCalendar.currentCalendar().component(.Weekday, fromDate: lastDay!)
        let extraPostMonthDays = 7 - weekdayOfLastDay
        
        return numDays + extraPreMonthDays + extraPostMonthDays
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//let weekday = NSCalendar.currentCalendar().component(.Weekday, fromDate: NSDate())
        return UICollectionViewCell()
    }
}
//extension ViewController: UICollectionViewDelegate {
//    collection
//}

