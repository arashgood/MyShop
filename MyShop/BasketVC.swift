//
//  BasketVC.swift
//  MyShop
//
//  Created by Arash on 3/21/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

class BasketVC: UIViewController,UITableViewDelegate,UITableViewDataSource, availableNumberChangeDelegate, SuccessDelagte {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var guide: UIStackView!
    @IBOutlet weak var buy_whole_basket_btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshCounters(number: nil,background: nil)
        setGuide()
        setNotifications()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGuide()
        refreshCounters(number: nil, background: nil)
        self.tableView.reloadData()
    }
    
    // Actions *****************************************************
    @IBAction func go_to_search_page(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func buy_whole_of_basket(_ sender: UIButton) {
        
    }
    
    // TableView funcs **********************************************
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Basket.instance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketCell
        let c = makeBasketCell(cell: cell, product: Basket.instance.products[indexPath.row], index: indexPath.row)
        c.selectionStyle = .none
        return c
    }
    
    
    // funcs **********************************************************
    func makeBasketCell(cell: BasketCell, product: Product, index: Int) -> UITableViewCell {
        
        print(product.number)
        let title = String(product.title)!
        let price = product.price
        let imgStrUrl = String(product.imgStrUrl)!
        let number = product.number
        cell.product = product
        cell.configureCell(imgStrUrl: imgStrUrl, title: title, price: price, index: index, number: number)
        cell.changeDelagate = self
        cell.successDelegate = self
        
        return cell
    }
    
    //**
    func reloadTable() {
        self.tableView.reloadData()
        refreshCounters(number: nil, background: nil)
    }
    
    //**
    func setGuide() {
        
        if Basket.instance.count > 0 {
            
            self.guide.isHidden = true
            self.buy_whole_basket_btn.isHidden = false
        } else {
            self.guide.isHidden = false
            self.buy_whole_basket_btn.isHidden = true
            
        }
        
    }
    
    //**
    func setNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTable), name: .reloadTable, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.setGuide), name: .setGuide, object: nil)
    }
    
    //**
    func goHomeShowAlert() {
        self.tabBarController?.selectedIndex = 0
        NotificationCenter.default.post(name: .showSuccessAlert, object: nil)
    }
    

    
    //end of class
}
