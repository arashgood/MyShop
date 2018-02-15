//
//  BasketCounter.swift
//  MyShop
//
//  Created by Arash on 3/19/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class BasketCounterView: UIView {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.shadowColor = SHADOW_COLOR.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
    }

    
    //end of class
}
