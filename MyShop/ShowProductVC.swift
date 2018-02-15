//
//  ShowProductVC.swift
//  MyShop
//
//  Created by Arash on 3/26/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.

import UIKit
import SDWebImage

class ShowProductVC: UIViewController {
    

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescriptions: UITextView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var product: Product!
    
   
    override func viewDidLoad() {
     
        productImage.sd_setImage(with: URL(string: product.imgStrUrl), placeholderImage: #imageLiteral(resourceName: "productTest"))
        productDescriptions.text = product.desc
        numberLabel.text = String(product.number)
    }
    
    //  actions **************************
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToBasket(_ sender: Any) {
        checkBasketAdd()
    }
    
    @IBAction func addToFavorite(_ sender: Any) {
        checkLikedProductsAdd()
    }
    
    @IBAction func addOneMore(_ sender: Any) {
        handleAdder()
    }
    
    @IBAction func minusOne(_ sender: Any) {
        
        if product._number! > 1 {
            self.product._number! -= 1
            self.numberLabel.text = String(product._number!)
        }
        
    }
    
    //funcs **************************

    func checkBasketAdd() {
        var existsInBasket = false
        for prdct in Basket.instance.products {
            if prdct.id == self.product.id {
                existsInBasket = true
            }
        }
        
        if !existsInBasket {
            Basket.instance.addProduct(product: self.product)
            showGreenToast(msg: "محصول به سبد افزوده شد", vc: self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.dismiss(animated: true, completion: nil)
            }
            return
        }
        showRedToast(msg: "محصول در سبد خرید موجود است ", vc: self)
    }
    
    //**
    func checkLikedProductsAdd() {
        var existsInLikedProducts = false
        for prdct in LikedProducts.instance.products {
            if prdct.id == self.product.id {
                existsInLikedProducts = true
            }
        }
        
        if !existsInLikedProducts {
            Basket.instance.addProduct(product: self.product)
            LikedProducts.instance.likeProduct(product: self.product)
            show‌BlueToast(msg: "محصول به علاقمندی های شما افزوده شد", vc: self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.dismiss(animated: true, completion: nil)
            }
            return
        }
        showRedToast(msg: "محصول در در علاقمندی های شما موجوداست ", vc: self)
    }
    
    
    //**
    func findProductIndex() -> Int {
        for (index,prdct) in testProducts.enumerated() {
            if prdct.id == product.id {
                return index
            }
        }
        return 0
    }
    
    //**
    func handleAdder() {
//        let index = findProductIndex()
//        if index == 0 {
//            return
//        }
        if product.availableNumber < (product._number! + 1)  {
            showToast(msg: "موجود نیست!", vc: self)
            return
        }
        
        self.product._number! += 1
        self.numberLabel.text = String(product._number!)
    }
    
 // end of class
}
