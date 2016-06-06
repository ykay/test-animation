//
//  SpringView.swift
//  test-animation
//
//  Created by Kanni on 6/5/16.
//  Copyright © 2016 kanni. All rights reserved.
//

import Foundation
import Advance

class SpringView: UIView {
    let spring = Spring(value: CGPoint.zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.blueColor()
        
        spring.configuration.tension = Scalar(50)
        spring.changed.observe { [unowned self] p in
//            self.center = p
            print("p")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}