//
//  LikedProducts.swift
//  MyShop
//
//  Created by Arash on 3/27/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import Foundation

class LikedProducts {
    static let instance = LikedProducts()
    
    private var _prodcucts = [Product]()
    
    var products: [Product] {
        return _prodcucts
    }
    
    var count: Int {
        return self._prodcucts.count
    }
    
    func likeProduct(product: Product) {
        self._prodcucts.append(product)
    }
    
    func remove(atIndex i: Int) {
        self._prodcucts.remove(at: i)
    }
}
