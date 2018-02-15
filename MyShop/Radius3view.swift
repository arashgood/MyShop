//
//  Radius6view.swift
//  MyShop
//
//  Created by Arash on 3/27/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class Radius3view: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 3.0
        self.clipsToBounds = true
    }

}
