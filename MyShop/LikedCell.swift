//
//  LikedCell.swift
//  MyShop
//
//  Created by Arash on 3/26/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit
import SDWebImage

class LikedCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView! {
        didSet {
            makeRadius2(view: img)
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addToBasket: UIButton! {
        didSet {
            makeRadius6(view: addToBasket)
        }
    }
    @IBOutlet weak var deletePrdct: UIButton! {
        didSet {
            makeRadius6(view: deletePrdct)
            deletePrdct.backgroundColor = CUSTOM_RED
        }
    }
    
    var indexInLiked: Int!
    var product: Product!
    
    
    
    func configureCell(imgStrUrl: String, title: String, price: Int, product: Product,index: Int) {
        
        let url = URL(string: imgStrUrl)
        self.img.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "prelo.gif"))
        self.title.text = title
        self.price.text = String(price)
        self.product = product
        self.indexInLiked = index
        print(index)
    }
    
    // actions *****************************************************
    @IBAction func addToBasket(_ sender: Any) {
        
        var existsInBasket = false
        for prdct in Basket.instance.products {
            if prdct.id == self.product.id {
                existsInBasket = true
            }
        }
        
        NotificationCenter.default.post(name: .addToBasket, object: nil, userInfo: [existsInBasket:indexInLiked])
        
    }
    
    @IBAction func deletePrdct(_ sender: Any) {
            NotificationCenter.default.post(name: .dltFromLiked, object: nil, userInfo: ["index":indexInLiked])
    }

}
