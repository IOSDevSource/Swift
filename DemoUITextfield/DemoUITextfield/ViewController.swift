//
//  ViewController.swift
//  DemoUITextfield
//
//  Created by iexm01 on 05/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Variable Declaration
    @IBOutlet var textfield1: UITextField!
    @IBOutlet var textfield2: UITextField!
    @IBOutlet var textfield3: UITextField!

    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        texfield_widget_configuration()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - User Defined Methods
    func texfield_widget_configuration() {
        textfield1.delegate = self
        textfield1.clearButtonMode = .whileEditing
        textfield1.layer.borderColor = UIColor.blue.cgColor
        textfield1.layer.borderWidth = 1.0
        
        textfield2.delegate = self
        textfield2.clearButtonMode = .whileEditing
        textfield2.underlinedBlue()
        
        textfield3.delegate = self
        textfield3.clearButtonMode = .whileEditing
        textfield3.underlinedBlue()
        
        let textfield4 = UITextField()
        textfield4.frame = CGRect.init(x: 25, y: textfield3.frame.origin.y + textfield3.frame.size.height + 65, width: 323, height: 30)
        textfield4.font = UIFont.init(name: "ProximaNova-Regular", size: 17.0)
        textfield4.textColor = UIColor.black
        textfield4.layer.borderColor = UIColor.blue.cgColor
        textfield4.layer.borderWidth = 1.0
        textfield4.delegate = self
        textfield4.borderStyle = .roundedRect
        textfield4.clearButtonMode = .whileEditing
        self.view.addSubview(textfield4)
    }
    
    
    // MARK: - UITextfield Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("\(textField.frame.origin.y)")
        if textField == textfield3 {
            textfield3.underlinedRed()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        view.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(view.frame.size.width), height: CGFloat(view.frame.size.height))
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && string == " " || range.location == 0 && string == "'" {
            print("empty string not allowed")
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == textfield3) {
            textfield3.underlinedBlue()
        }
    }
}

//MARK: - Extension for Line Textfield
extension UITextField {
    func underlinedBlue() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func underlinedRed() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor(red: 255/255, green: 0/255, blue:0/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
