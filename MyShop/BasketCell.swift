//
//  BasketCell.swift
//  MyShop
//
//  Created by Arash on 3/21/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit
import SDWebImage

class BasketCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView! {
        didSet {
            makeRadius2(view: img)
        }
    }
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var number: UILabel!
    
    
    var index: Int!
    
    

    func configureCell(imgStrUrl: String, title: String, price: Int, index: Int, number: Int) {
        
        self.img.sd_setImage(with: URL(string: imgStrUrl), placeholderImage: #imageLiteral(resourceName: "prelo.gif"))
        self.title.text = title
        self.price.text = String(price)
        self.index = index
        self.number.text = String(number)
    }
    
    @IBAction func buyProduct(_ sender: Any) {
        
        let product = Basket.instance.products[index]
        
        print("\(product.title)")
        Basket.instance.pay(product: product)
        
        
    }
   
    @IBAction func deleteProduct(_ sender: UIButton) {
        
        
            let product = Basket.instance.products[index]
            Basket.instance.removeProduct(product: product)
            print("\(product.title) deleted")
            
            //reload Table
            NotificationCenter.default.post(name: .reloadTable, object: nil)
        
            
            if Basket.instance.count == 0 {
                
                NotificationCenter.default.post(name: .setGuide, object: nil)
            
            }
        
        
        
    }
    
    
}
