//
//  Product.swift
//  MyShop
//
//  Created by Arash on 3/14/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import Foundation

class Product {
    
     var _imgStrUrl: String!
     var _title: String!
     var _desc: String!
     var _price: Int!
     var _id: Int!
     var _number: Int!
     var _availableNumber: Int!
    
    
    var imgStrUrl: String {
        return _imgStrUrl
    }
    
    var title: String {
        return _title
    }
    
    var desc: String {
        return _desc
    }
    
    var price: Int {
        return _price
    }
    
    var id: Int {
        return _id
    }
    
    var number: Int {
        return _number
    }
    
    var availableNumber: Int {
        return _availableNumber
    }
    
    init(url: String, title: String, desc: String, price: Int,id: Int, number: Int, availableNumber: Int) {
        
        self._imgStrUrl = url
        self._title = title
        self._price = price
        self._id = id
        self._desc = desc
        self._number = number
        self._availableNumber = availableNumber
    }
}
