//
//  UIButtonCustomClass.swift
//  DBinSwift3
//
//  Created by tops on 12/7/16.
//  Copyright © 2016 N2n. All rights reserved.
//

import UIKit

class UIButtonCustomClass: UIButton {

        var strAhmedabad = ""
        var strBaroda = ""
        var strSurat = ""
        var strGandhinagar = ""
        var strBhuj = ""
        var strRajkot = ""
    
        // Images
        let checkedImage = UIImage(named: "Checkbox Filled.png")! as UIImage
        let uncheckedImage = UIImage(named: "Checkbox.png")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: [])
                    
                    
                } else {
                    self.setImage(uncheckedImage, for: [])
                    
                }
            }
        }
        
        override func awakeFromNib() {
            self.addTarget(self, action: #selector(UIButtonCustomClass.buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
            self.isChecked = false
        }
        
        func buttonClicked(sender: UIButton) {
        
            if sender.tag == 0{
                strAhmedabad = "Ahmedabad"
            }
            else if sender.tag == 1{
                strBaroda = "Baroda"
            }
            else if sender.tag == 2{
                strSurat = "Surat"
            }
            else if sender.tag == 3{
                strGandhinagar = "Gandhinagar"
            }
            else if sender.tag == 4{
                strRajkot = "Bhuj"
            }
            else{
                strRajkot = "Rajkot"

            }
            if sender == self{
                isChecked = !isChecked
            }
        /*
             if sender == self {
             isChecked = !isChecked
             
             switch sender.tag {
             case 0:
             strAhmedabad = "Ahmedabad"
             case 1:
             strBaroda = "Baroda"
             case 2:
             strSurat = "Surat"
             case 3:
             strGandhinagar = "Gandhinagar"
             case 4:
             strBhuj = "Bhuj"
             case 5:
             strRajkot = "Rajkot"
             default:
             strAhmedabad = "Ahmedabad"
             }
             
             }

        */
            
        }
    
}
