//
//  DetailRandomUserController.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/26/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class DetailRandomUserController: UIViewController {
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    var theData: UserData?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
     
    func updateUI() {
    guard let userData = theData else {
    fatalError("err,err")
        }
        adressLabel.text = ("\(userData.location.city), \(userData.location.country)")
        dateOfBirthLabel.text = "Date of birth: \(userData.dob.date)"
        phoneNumberLabel.text = "Phone number: \(userData.phone)"
    }

}
