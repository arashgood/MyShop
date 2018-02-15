//
//  SearchVC.swift
//  MyShop
//
//  Created by Arash on 3/14/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import Foundation
import UIKit

class SearchVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var basket_counter_number: UILabel!
    @IBOutlet weak var basket_counter_background: BasketCounterView!
    
    @IBOutlet weak var productClassesPickerView: UIPickerView!
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var showAscendantSwitch: UISwitch!
    @IBOutlet weak var justExistingProductsSwich: UISwitch!
    
    @IBOutlet weak var filtersStackView: UIStackView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool) {
        //refreshBC(number: self.basket_counter_number, background: self.basket_counter_background)
    }
    
    override func viewDidLoad() {

        
        //refreshBC(number: self.basket_counter_number, background: self.basket_counter_background)
        productClassesPickerView.dataSource = self
        productClassesPickerView.delegate = self
        
        
    }
    
    // actions ************************************************
    
    @IBAction func activateFilter(_ sender: UISwitch) {
        
        if sender.isOn {
            filtersStackView.isUserInteractionEnabled = true
            coverView.isHidden = true
        } else {
            filtersStackView.isUserInteractionEnabled = false
            coverView.isHidden = false
        }
    }
    
    @IBAction func go_to_basket_page(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func find(_ sender: UIButton) {
        
    }
    
    // pickerView funcs ***************************************
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testCategories[row]
    }
    
    
    
    
    
    
    
  //end of class
}
