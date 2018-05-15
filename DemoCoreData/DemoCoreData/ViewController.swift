//
//  ViewController.swift
//  DemoCoreData
//
//  Created by iexm01 on 26/03/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Varivable Declaration
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet var txtfld_usernmae: UITextField!
    @IBOutlet var txtfld_password: UITextField!
    @IBOutlet var txtfld_age: UITextField!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - User Defined Methods
    func coreDataSetup() {
        txtfld_usernmae.delegate = self
        txtfld_password.delegate = self
        txtfld_age.delegate = self
    }
    
    //MARK: - IBActions
    @IBAction func save_fetch_CoreData_Action(sender: UIButton) {
        switch sender.tag {
        case 0: // save
            if (txtfld_usernmae.text?.isEmpty)! || (txtfld_password.text?.isEmpty)! || (txtfld_age.text?.isEmpty)! {
                Common.showAlert(header: "Warning", message: "Please enter all the field")
                return
            }
            let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue(txtfld_usernmae.text!, forKey: "username")
            newUser.setValue(txtfld_password.text!, forKey: "password")
            newUser.setValue(txtfld_age.text!, forKey: "age")
            do {
                try context.save()
                Common.showAlert(header: "Success", message: "Details saved successfully")
            } catch {
                print("Failed saving")
            }
            break
        case 1: // fetch
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                print(result.count)
                print(result)
                for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "username") as! String)
                    print(data.value(forKey: "password") as! String)
                    print(data.value(forKey: "age") as! String)
                }
            } catch {
                print("Failed")
            }
            break
        default:
            break
        }
    }
    
    // MARK: - UITextfield Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

class Common: NSObject {
    class func showAlert (header: String, message: String) {
        let alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

