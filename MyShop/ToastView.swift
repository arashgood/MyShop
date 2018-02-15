//
//  ToastView.swift
//  MyShop
//
//  Created by Eligasht Developer1 on 2/15/18.
//  Copyright © 2018 arashgood. All rights reserved.
//

import Foundation

import UIKit

class ToastView: UIView {
    
    private var msg = UILabel()
    let width = UIScreen.main.bounds.width
    
    private var duration = 0.5
    private var height: CGFloat = 55
    
    //funcs *********************
    func setInfo(message: String, vc: UIViewController) {
        
        
        //self
        self.frame.size.width = self.width
        self.backgroundColor = UIColor.darkGray
        
//        if UIDevice.current.modelName == "iPhone X" {
//            height *= 2
//            
//        }
        self.frame.size.height = height
        
        self.set_initial_frame(view: self)
        self.layer.cornerRadius = 5
        
        
        //msg
        self.msg.text = message
        self.msg.textColor = UIColor.white
        self.msg.textAlignment = .center
        self.msg.numberOfLines = 0
        self.msg.font = iranSans20
        self.msg.frame = CGRect(x: 1, y: height - 30, width: self.width, height: 20)
        self.msg.adjustsFontSizeToFitWidth = true
        self.addSubview(self.msg)
        
        vc.view.addSubview(self)
        self.animate(toDown: true, view: self)
        
        let twoSec = DispatchTime.now() + 2.8
        DispatchQueue.main.asyncAfter(deadline: twoSec, execute: {
            self.animate(toDown: false, view: self)
        })
        
        
    }
    
    //**
    func setDuration(duration: Double) {
        self.duration = duration
    }
    
    func setColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    private func set_initial_frame(view: UIView) {
        let w = UIScreen.main.bounds.width
        view.frame = CGRect(x: 0, y: -height  , width: w, height: height)
    }
    
    private func animate(toDown: Bool, view: UIView) {
        
        UIView.animate(withDuration: duration, delay: 0.7, options: .transitionFlipFromTop, animations: {
            
            var viewFrame = view.frame
            
            if toDown {
                viewFrame.origin.y += viewFrame.size.height
            } else {
                viewFrame.origin.y -= viewFrame.size.height
            }
            
            view.frame = viewFrame
        }, completion: { _ in
            
            if !toDown {
                self.set_initial_frame(view: view)
            }
        })
    }
    
    private func set_final_frame(view: UIView) {
        let w = UIScreen.main.bounds.width
        view.frame = CGRect(x: 0, y: -height  , width: w, height: 65)
    }
    
    @objc private func animateToTop() {
        animate(toDown: false, view: self)
    }
    
}
