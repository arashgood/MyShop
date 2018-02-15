//
//  EditUserInfoVC.swift
//  MyShop
//
//  Created by Arash on 3/25/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit

protocol backedFromEdit {
    func backedFromEdit()
}

class EditUserInfoVC: UIViewController {

    var delegate: backedFromEdit? = nil
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var cellphone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextView!
    
    var tempName: String!
    var tempSurname: String!
    var tempPhone: String!
    var tempCellPhone: String!
    var tempEmail: String!
    var tempAddress: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.delegate?.backedFromEdit()
        transferInfo()
    }
    
    

    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true) { 
            
        }
    }
    
    @IBAction func submit(_ sender: UIButton) {
        showSubmitAllert()
    }
    
    // funcs *******************************************************
    func showSubmitAllert() {
        
        let allert = UIAlertController(title: "ثبت اطلاعات", message: "اطلاعات جدید جایگزین شود؟", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "خیر", style: .default, handler: nil)
        let submitAction = UIAlertAction(title: "بله", style: .destructive) { (act) in
            print("new info replaced.\n")
        }
        
        allert.addAction(submitAction)
        allert.addAction(cancelAction)
        
        self.present(allert, animated: true, completion: nil)
    }
    
    func transferInfo() {
        
        self.name.text = tempName
        self.surname.text = tempSurname
        self.phone.text = tempPhone
        self.cellphone.text = tempCellPhone
        self.email.text = tempEmail
        self.address.text = tempAddress
    }
    
    //end of class
}
