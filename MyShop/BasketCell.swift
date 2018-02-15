//
//  BasketCell.swift
//  MyShop
//
//  Created by Arash on 3/21/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit
import SDWebImage


protocol availableNumberChangeDelegate: class {
    func reloadTable()
}

protocol SuccessDelagte: class {
    func goHomeShowAlert()
}


class BasketCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView! {
        didSet {
            makeRadius2(view: img)
        }
    }
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var number: UILabel!
    
    var product: Product!
    var index: Int!
    var changeDelagate: availableNumberChangeDelegate!
    var successDelegate: SuccessDelagte!

    
    // actions ************************************
   
    //**
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
    
    //**
    @IBAction func addOneMore(_ sender: Any) {
        
        testBasket[index]._number! += 1
        
        self.changeDelagate.reloadTable()
    }
    
    //**
    @IBAction func minusOne(_ sender: Any) {
        
        testBasket[index]._number! -= 1
        self.changeDelagate.reloadTable()
    }
    
    //**
    @IBAction func buyProduct(_ sender: Any) {
        Basket.instance.removeProduct(product: product)
        changeAvailableNumber()
        self.successDelegate.goHomeShowAlert()
    }
    
    // funcs ***********************************
    func configureCell(imgStrUrl: String, title: String, price: Int, index: Int, number: Int) {
        
        self.img.sd_setImage(with: URL(string: imgStrUrl), placeholderImage: #imageLiteral(resourceName: "prelo.gif"))
        self.title.text = title
        self.price.text = String(price)
        self.index = index
        self.number.text = String(number)
    }
    
    //**
    func changeAvailableNumber() {
        for i in testProducts {
            if i.id == self.product.id {
                testProducts[index]._availableNumber! -= product.number
            }
        }
    }
    
 
    

    
    
    
    // end of class
}
