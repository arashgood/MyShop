//
//  ShowProductVC.swift
//  MyShop
//
//  Created by Arash on 3/26/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.

import UIKit

class ShowProductVC: UIViewController {
    
    @IBOutlet var emptyHeart: UIImageView!
    @IBOutlet var fullfieldHeart: UIImageView!
    
    @IBOutlet weak var basket_counter_number: UILabel!
    @IBOutlet weak var basket_counter_background: BasketCounterView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescriptions: UITextView!
    
    var product: Product!
    
    override func viewDidLoad() {
        
        emptyHeart.isHidden = false
        fullfieldHeart.isHidden = true
        fillTestData()
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
    
    
 // end of class
}
