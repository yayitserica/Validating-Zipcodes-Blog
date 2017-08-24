//
//  ViewController.swift
//  ZipCodes
//
//  Created by Erica Millado on 8/23/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //8 -
    @IBOutlet var textField: UITextField!
    @IBOutlet var validateBtn: UIButton!
    @IBOutlet var responseLabel: UILabel!
    
    //9 -
    var zipArray: [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validateBtn.layer.cornerRadius = 5.0
        validateBtn.layer.masksToBounds = true
        
        //10 -
        ZipCodeStore.readJson { (zipcodes) in
            self.zipArray = zipcodes
        }
    }
    
    //11 -
    @IBAction func validateBtnTapped(_ sender: UIButton) {
        if let textFieldZip = textField.text {
            if let enteredZip = Int(textFieldZip) {
                //12 -
                if isValid(enteredZip) {
                    responseLabel.text = "Valid zipcode!"
                } else {
                    responseLabel.text = "Try another zipcode."
                    textField.text = ""
                }
            }
        }
    }
    
    
    
    //12 -
    func isValid(_ zipCode: Int) -> Bool {
        return zipArray.contains(zipCode)
    }
}










