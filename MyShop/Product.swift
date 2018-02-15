//
//  Product.swift
//  MyShop
//
//  Created by Arash on 3/14/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import Foundation

class Product {
    
    private var _imgStrUrl: String!
    private var _title: String!
    private var _price: Int!
    private var _id: Int!
    private var _number: Int!
    
    var imgStrUrl: String {
        return _imgStrUrl
    }
    
    var title: String {
        return _title
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
    
    
    init(url: String, title: String, price: Int,id: Int, number: Int) {
        
        self._imgStrUrl = url
        self._title = title
        self._price = price
        self._id = id
        self._number = number
    }
}
