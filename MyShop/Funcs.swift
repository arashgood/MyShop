//
//  Funcs.swift
//  MyShop
//
//  Created by Eligasht Developer1 on 2/15/18.
//  Copyright © 2018 arashgood. All rights reserved.
//

import Foundation
import UIKit

// funcs **************************************************************************
func refreshCounters(number: UILabel?, background: UIView?){
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    let window = appDel.window
    
    let tabBarController: UITabBarController? = (window?.rootViewController as? UITabBarController)
    let tabBar: UITabBar? = tabBarController?.tabBar
    
    let tabBarItem4: UITabBarItem? = tabBar?.items?[3]
    let tabBarItem3: UITabBarItem? = tabBar?.items?[2]
    
    //************ set basket counter indictor ***********
    if Basket.instance.count > 0 {
        
        number?.isHidden = false
        background?.isHidden = false
        number?.text = String(Basket.instance.count)
        background?.backgroundColor = CUSTOM_GREEN
        tabBarItem3?.badgeColor = CUSTOM_GREEN
        tabBarItem3?.badgeValue = make_persian_number(number: Basket.instance.count)
        
        
    } else {
        
        number?.isHidden = true
        background?.isHidden = true
        tabBarItem3?.badgeValue? = ""
        tabBarItem3?.badgeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    //********** set liked products badge counter *************
    if LikedProducts.instance.count > 0 {
        
        tabBarItem4?.badgeColor = CUSTOM_BLUE
        tabBarItem4?.badgeValue = make_persian_number(number: LikedProducts.instance.count)
    } else {
        tabBarItem4?.badgeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        tabBarItem4?.badgeValue = ""
    }
}

func downloadImage(url: String,_ callback: @escaping (UIImage) -> Void ) {
    
    let url = URL(string: url)
    
    do {
        
        if let imgData = NSData(contentsOf: url!) as Data? {
            let img = UIImage(data: imgData)!
            callback(img)
        }
        
        
    }
    
}

//**
func showAllert(title: String,msg: String, vc: UIViewController) {
    let allert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    let action = UIAlertAction(title: "تایید", style: .default, handler: nil)
    
    allert.addAction(action)
    vc.present( allert, animated: true, completion: nil)
}

//**
func resizeImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
    image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
}

//**
func make_persian_number(number: Int) -> String {
    
    var result = ""
    
    //spliting by using Extension to Int
    let numArr = number.array
    
    for digit in numArr {
        
        switch digit {
        case 1:
            result += "۱"
        case 2:
            result += "۲"
        case 3:
            result += "۳"
        case 4:
            result += "۴"
        case 5:
            result += "۵"
        case 6:
            result += "۶"
        case 7:
            result += "۷"
        case 8:
            result += "۸"
        case 9:
            result += "۹"
        case 0:
            result += "۰"
        default:
            print("entered number has a problem.")
        }
    }
    
    return result
}

//**
func makeRadius6(view: UIView) {
    
    view.layer.cornerRadius = 6.0
    view.clipsToBounds = true
}

//**
func makeRadius2(view: UIView) {
    
    view.layer.cornerRadius = 2.0
    view.clipsToBounds = true
}

//**
func makeCircle(view: UIView) {
    
    view.layer.cornerRadius = view.frame.size.height / 2
    view.clipsToBounds = true
}


