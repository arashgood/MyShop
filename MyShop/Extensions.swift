//
//  Extensions.swift
//  MyShop
//
//  Created by Eligasht Developer1 on 2/15/18.
//  Copyright © 2018 arashgood. All rights reserved.
//

import Foundation


// ectentions *********************************************************************

extension Int {
    var array: [Int] {
        return description.characters.flatMap{Int(String($0))}
    }
}

extension NSNotification.Name {
    static let reloadTable = NSNotification.Name(rawValue: "reloadTable")
    static let setGuide = NSNotification.Name(rawValue: "setGuide")
    static let dltFromLiked = NSNotification.Name(rawValue: "dltFromLiked")
    static let addToBasket = NSNotification.Name(rawValue: "addToBasket")
}
