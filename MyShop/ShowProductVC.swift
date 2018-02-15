//
//  ShowProductVC.swift
//  MyShop
//
//  Created by Arash on 3/26/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.

import UIKit
import SDWebImage

class ShowProductVC: UIViewController {
    
    @IBOutlet var emptyHeart: UIImageView!
    @IBOutlet var fullfieldHeart: UIImageView!
    
    @IBOutlet weak var basket_counter_number: UILabel!
    @IBOutlet weak var basket_counter_background: BasketCounterView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescriptions: UITextView!
    
    var product: Product!
   
    override func viewDidLoad() {
        
        //emptyHeart.isHidden = false
        //fullfieldHeart.isHidden = true
        productImage.sd_setImage(with: URL(string: product.imgStrUrl), placeholderImage: #imageLiteral(resourceName: "productTest"))
        productDescriptions.text = product.desc
    }
    
    //  actions ***********
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToBasket(_ sender: Any) {
        checkBasketAdd()
    }
    
    @IBAction func addToFavorite(_ sender: Any) {
        checkLikedProductsAdd()
    }
    
    
    //**
    func fillTestData() {
        let likedPrdcts = testLikedProducts
        
        for prdct in likedPrdcts {
            if product.id == prdct.id {
                emptyHeart.isHidden = true
                fullfieldHeart.isHidden = false
            }
        }
    }
    
    //**
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
            //refreshCounters(number: <#T##UILabel?#>, background: <#T##UIView?#>)
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
            //refreshCounters(number: <#T##UILabel?#>, background: <#T##UIView?#>)
            return
        }
        showRedToast(msg: "محصول در در علاقمندی های شما موجوداست ", vc: self)
    }
    
    
 // end of class
}
