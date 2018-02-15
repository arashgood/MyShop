//
//  titleBackView.swift
//  MyShop
//
//  Created by Arash on 3/19/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class titleBackView: UIView {

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = SHADOW_COLOR.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        
    }
}


