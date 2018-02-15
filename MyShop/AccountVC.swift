//
//  AccountVC.swift
//  MyShop
//
//  Created by Arash on 3/23/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class AccountVC: UIViewController,UITableViewDelegate,UITableViewDataSource,backedFromEdit {
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    var editUsrInf = EditUserInfoVC()
    
    var orders: [Order] = testOrders
    
    // informationView Outlets **********************
    @IBOutlet weak var informationsView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var cellPhone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    // orderView Outlets ****************************
    @IBOutlet weak var ordersView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var guide: UILabel!
    
    
    
    @IBOutlet weak var basket_counter_number: UILabel!
    @IBOutlet weak var basket_counter_background: BasketCounterView!
    
    override func viewWillAppear(_ animated: Bool) {

        informationsView.isHidden = true
        ordersView.isHidden = false
        
         refreshCounters(number: self.basket_counter_number, background: self.basket_counter_background)
    }
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        setImg()
        setGuide()
        
         refreshCounters(number: self.basket_counter_number, background: self.basket_counter_background)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        let editUsrInf = EditUserInfoVC()
//        editUsrInf.delegate = self
//        
//        self.present(editUsrInf, animated: true, completion: nil)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//
//    }
    
    // actions ************************************************
    @IBAction func indexChanged(sender: UISegmentedControl)
    {
        switch segment.selectedSegmentIndex
        {
        case 0:
            self.informationsView.isHidden = true
            self.ordersView.isHidden = false
        case 1:
            self.informationsView.isHidden = false
            self.ordersView.isHidden = true
        default:
            break
        }
    }
    
    @IBAction func editInfo(_ sender: UIButton) {
        
       //segment.selectedSegmentIndex = 1
       let info = [name.text,surname.text,phone.text,cellPhone.text,email.text,address.text]
       performSegue(withIdentifier: "accountVC2EditUserInfoVC", sender: info)
    }
    
    //tableView funcs ******************************************
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as? OrderCell {
            
            let c = makeOrderCell(cell: cell, order: orders[indexPath.row])
            c.selectionStyle = .none
            return c
        } else {
            return UITableViewCell()
        }
    }
    
    // funcs ****************************************************
    func makeOrderCell(cell: OrderCell, order:Order) -> UITableViewCell {
        
        if let imgUrl = String(order.imgStrUrl) {
            if let title = String(order.title) {
                if let price = order.price as? Int {
                    if let number = order.number as? Int {
                        if let state = order.state as? Int {
                            cell.configureCell(imgStrUrl: imgUrl, orderTitle: title, orderPrice: price, orderState: state, number: number)
                            return cell
                        } else {
                            return UITableViewCell()
                        }
                    } else {
                        return UITableViewCell()
                    }
                }else {
                    return UITableViewCell()
                }
            } else {
                return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
       //end of makeOrderCell
    }
    
    func setGuide() {
        
        if orders.count > 0 {
            guide.isHidden = true
        } else {
            guide.isHidden = false
        }
        
    }
    
    func setImg() {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let imgHeight = screenSize.height * 0.225
        let imgWidth = imgHeight
        print(imgHeight)
        self.img.frame = CGRect(x: 0, y: 0, width: imgWidth, height: imgHeight)
        
        print(self.img.frame.height)
    }
    
    func backedFromEdit() {
        
        segment.selectedSegmentIndex = 1
        self.informationsView.isHidden = false
        self.ordersView.isHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let EditVc = segue.destination as? EditUserInfoVC {
            if let infoArr = sender as? [String] {
                
                EditVc.tempName = infoArr[0]
                EditVc.tempSurname = infoArr[1]
                EditVc.tempPhone = infoArr[2]
                EditVc.tempCellPhone = infoArr[3]
                EditVc.tempEmail = infoArr[4]
                EditVc.tempAddress = infoArr[5]
            }
        }
    }
    
    
    
  //end of class
}
