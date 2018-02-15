//
//  CustomCollectionView.swift
//  MyShop
//
//  Created by Arash on 3/14/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class CustomCollectionView: UICollectionView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //self.layer.cornerRadius = 2.0
        self.layer.shadowColor = SHADOW_COLOR.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
    }
    
}



func placeholder() {
    let imgView = UIImageView()
    var bundle = Bundle(url: Bundle.main.url(forResource: "placeholder.gif", withExtension: "gif")!)
    var imagePath: String? = bundle?.path(forResource: "placeholder.gif", ofType: "gif")
    var image = UIImage(contentsOfFile: imagePath!)
    
    imgView.image = image
}
