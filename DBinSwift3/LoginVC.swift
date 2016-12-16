//
//  LoginVC.swift
//  DBinSwift3
//
//  Created by tops on 12/5/16.
//  Copyright © 2016 N2n. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    @IBOutlet weak var btn_forgPass: UIButton!
    
    var myQuery: String = ""

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        
        var tempArray=NSMutableArray()
        
        myQuery = "select * from usertable where email='\(txt_email.text!)',password='\(txt_password.text!)'"
        
        print(myQuery)
        let dml = DMLServices()
        tempArray = dml.selectQuery(query: myQuery)
        
        print(tempArray.count)
        
        if tempArray.count == 0
        {
            let alert=UIAlertController(title: "Login Alert", message: "Login Failed..! Re-enter Email and Password.", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        else
        {
            print("You are loged in!!!")
        }
        
    }

    @IBAction func ForgetPasswordButton(_ sender: UIButton) {
    }
   
    @IBAction func NewUserButton(_ sender: UIButton)
    {
        let newuser=self.storyboard?.instantiateViewController(withIdentifier: "regVC") as! RegistrationVC
        self.navigationController?.pushViewController(newuser, animated: true)
    }

}
