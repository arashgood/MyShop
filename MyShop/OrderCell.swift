//
//  OrderCell.swift
//  MyShop
//
//  Created by Arash on 3/25/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var orderImg: UIImageView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderState: UILabel!
    @IBOutlet weak var numberOfOrder: UILabel!
    
    
    func configureCell(imgStrUrl: String, orderTitle: String, orderPrice: Int,orderState: Int, number: Int) {
        
        self.orderImg.sd_setImage(with: URL(string: imgStrUrl), placeholderImage: #imageLiteral(resourceName: "prelo.gif"))
        self.orderTitle.text = orderTitle
        self.orderPrice.text = String(orderPrice)
        self.orderState.text = setOrderState(orderState: orderState)
        self.numberOfOrder.text = String(number)
    }
    
    func setOrderState(orderState: Int) -> String {
        
        switch orderState {
            case 1:
                return "تایید نشده"
            case 2:
                return "در حال بررسی"
            case 3:
                return "ارسال شده"
            default:
                return "وضعیت نامشخص"
            
        }
    }
   

}
