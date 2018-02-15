//
//  Extensions.swift
//  MyShop
//
//  Created by Eligasht Developer1 on 2/15/18.
//  Copyright © 2018 arashgood. All rights reserved.
//

import Foundation
import UIKit

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
    static let showSuccessAlert = NSNotification.Name(rawValue: "showSuccessAlert")
}


//***
//extension UIApplication {
//    
//    //**
//    class func topVC(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let nav = base as? UINavigationController {
//            let top = topVC(nav.visibleViewController)
//            return top
//        }
//        
//        if let tab = base as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                let top = topVC(selected)
//                return top
//            }
//        }
//        
//        if let presented = base?.presentedViewController {
//            let top = topVC(presented)
//            return top
//        }
//        return base
//    }
//    
//    //**
//    var visibleViewController : UIViewController? {
//        //return keyWindow?.rootViewController?.topView
//    }
//}
//
////***
//extension UIWindow {
//    func topViewController2() -> UIViewController? {
//        var top = self.rootViewController
//        while true {
//            if let presented = top?.presentedViewController {
//                top = presented
//            } else if let nav = top as? UINavigationController {
//                top = nav.visibleViewController
//            } else if let tab = top as? UITabBarController {
//                top = tab.selectedViewController
//            } else {
//                break
//            }
//        }
//        return top
//    }
//}

