//
//  LikedVC.swift
//  MyShop
//
//  Created by Arash on 3/26/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class LikedVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var guide: UIStackView!
    
    @IBOutlet weak var basket_counter_number: UILabel!
    @IBOutlet weak var basket_counter_background: BasketCounterView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView()
        setGuide()
        setNotification()
         refreshCounters(number: self.basket_counter_number, background: self.basket_counter_background)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        setGuide()
        refreshCounters(number: self.basket_counter_number, background: self.basket_counter_background)
        
    }
    
    // Actions *****************************************************
    @IBAction func go_to_search_page(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func go_to_basket_page(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    // TableView funcs **********************************************
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LikedProducts.instance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "likedCell", for: indexPath) as? LikedCell {
            
            let c = makeLikedCell(cell: cell, product: LikedProducts.instance.products[indexPath.row], index: indexPath.row)
            c.selectionStyle = .none
            return c
        } else {
            return UITableViewCell()
        }
        
    }
    
    
    // funcs **********************************************************
    func makeLikedCell(cell: LikedCell, product: Product, index: Int) -> UITableViewCell {
        
        if let title = String(product.title) {
            if let price = product.price as? Int{
                if let imgStrUrl = String(product.imgStrUrl) {
                    
                    cell.configureCell(imgStrUrl: imgStrUrl, title: title, price: price, product: product, index: index)
                    return cell
                } else {
                    return UITableViewCell()
                }
            } else {
                return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
        
        //end of makeCell
    }

    func setGuide() {
        
        if LikedProducts.instance.count > 0 {
            
            self.guide.isHidden = true
        } else {
            self.guide.isHidden = false
        }
        
        
    }
    
    func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.dltFromliked), name: .dltFromLiked, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.addToBasket(_:)), name: .addToBasket, object: nil)
    }
    
    func dltFromliked(_ notif: Notification) {
        
        if let dict = notif.userInfo as? Dictionary<String, Int> {
            if let index = dict["index"] {
                
                commonAction(index: index)
            }
        }
    }
    
    func addToBasket(_ notif: Notification) {
        
        if let dict = notif.userInfo as? Dictionary<Bool, Int> {
            
            if let existInBasket = dict.keys.first {
                if let index = dict[existInBasket] {
                   
                    if !existInBasket {
                        
                        Basket.instance.addProduct(product: LikedProducts.instance.products[index])
                        commonAction(index: index)
                        
                    } else {
                        showAllert(title: "", msg: "این کالا در سبد خرید موجود است.", vc: self)
                    }
                }
                
            }
            
        }
        //end of addToBsket
    }
    
    func commonAction(index: Int) {
        
        LikedProducts.instance.remove(atIndex: index)
        setGuide()
        self.tableView.reloadData()
        refreshCounters(number: self.basket_counter_number, background: self.basket_counter_background)
    }
    
    //end of class
}
