//
//  MiddleCell.swift
//  MyShop
//
//  Created by Arash on 3/14/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftGifOrigin

class MiddleCell: UICollectionViewCell {
    
    @IBOutlet weak private var image: UIImageView!
    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var price: UILabel!
    @IBOutlet weak var availabaleNumbers: UILabel!
    
    
    func configureCell(imageStrUrl: String, title: String, price: Int, availalbleNumbers: Int){
    
    
        
        self.image.sd_setImage(with: URL(string: imageStrUrl), placeholderImage: #imageLiteral(resourceName: "prelo.gif"))
        self.availabaleNumbers.text = "تعداد موجود :‌\(String(availalbleNumbers))"
        self.title.text = title
        self.price.text = String(price)
    }
    
    
    
}
