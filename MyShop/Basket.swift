//
//  Basket.swift
//  MyShop
//
//  Created by Arash on 3/19/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import Foundation
import UIKit

class Basket {
    
    static let instance = Basket()
    
    //private var _products = Dictionary<Int, Product>()
    private var _products = [Product]()
    
    var count: Int {
        
        return self._products.count
    }
    
//    var products: Dictionary<Int, Product> {
//        return _products
//    }
    var products: [Product] {
        return _products
    }
    
    
    
    
    // funcs *******************************************************
    func addProduct(product: Product) {
        //self._products.updateValue(product, forKey: product.id)
        self._products.append(product)
        
    }
    
    func removeProduct(product: Product) {
        //self._products.removeValue(forKey: product.id)
        for i in 0..<_products.count {
            if _products[i].id == product.id {
                self._products.remove(at: i)
                break
            }
        }

    }
    
    
    func calculateTotalPrice() -> Int {
        
        var totalPrice = 0
        
        for prdct in _products {
            totalPrice += (prdct.number * prdct.price)
        }
        
        return totalPrice
    }
    
    func pay(product: Product) {
        
    }
    
    
    
    // end of class
}
