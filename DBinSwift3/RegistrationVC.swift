//
//  RegistrationVC.swift
//  DBinSwift3
//
//  Created by tops on 12/5/16.
//  Copyright © 2016 N2n. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtNumber: UITextField!
    @IBOutlet var txtDesignation: UITextField!
    @IBOutlet var txtDateOfJoin: UITextField!
    
    @IBOutlet var maleRadioButton: UIButton!
    @IBOutlet var femaleRadioButton: UIButton!
    
    @IBOutlet var AhmedabadCheckBox: UIButton!
    @IBOutlet var BarodaCheckBox: UIButton!
    @IBOutlet var SuratCheckBox: UIButton!
    @IBOutlet var GandhinagarCheckBox: UIButton!
    @IBOutlet var BhujCheckBox: UIButton!
    @IBOutlet var RajkotCheckBox: UIButton!
    
    
    
    var genderString = ""
    var myQuery = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
    myQuery = "insert into *** values "
        
    }

    @IBAction func updateButton(_ sender: UIButton) {
    }
    
    @IBAction func maleButtonPressed(_ sender: UIButton) {
        
        sender.setImage(UIImage(named: "Sun Symbol Filled-50.png"), for: [])
        femaleRadioButton.setImage(UIImage(named: "Sun Symbol-50.png"), for: [])
        genderString = "Male"
        print(genderString)
        
    }
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        
        sender.setImage(UIImage(named: "Sun Symbol Filled-50.png"), for: [])
        maleRadioButton.setImage(UIImage(named: "Sun Symbol-50.png"), for: [])
        genderString = "Female"
        print(genderString)
        
    }
    
    
    
}


