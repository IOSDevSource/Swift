//
//  ViewController.swift
//  DemoDynamicFramework
//
//  Created by iexm01 on 21/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import DemoGitFramework

class ViewController: UIViewController {

    let obj = IxmGeneric()
    let validate = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genericConfiguration()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        obj.showAlert(header: "Warning", message: "Welcome", view: (self.view.window?.rootViewController)!) { success, failure in
            if success == "OK" {
                print("alert ok button clicked")
            }
        }
    }
    
    func genericConfiguration() {
        obj.Test()
        
        /*************** WIFI ******************/
        let strWifi = obj.fetchSSIDInfo()
        print("wifi \(String(describing: strWifi))")
        
        /*************** Email ******************/
        let strEmail = validate.emailValidation(strMailString: "test123@g")
        if strEmail == "NO" {
            print("Invalid emil address")
        } else {
            print("Valid email address")
        }
        
        /*************** Email ******************/
        let trimString = validate.trimming_Right_End_WhiteSpaces("     123456")
        print("trimming \(trimString)")
        
        /*************** Device Type ******************/
        print("device type \(obj.deviceType())")
        
        print("current year \(obj.currentYear())")
        
        print("current month \(obj.currentMonth())")
        
        print("current date \(obj.getCurrentDate())")
        
        print("battery level \(obj.getBatteryPercentage())")
        
        print("Reachability \(obj.reachabilityChanged())")
        
        /*************** Hash String (MD5) ******************/
        let strHash = obj.md5(string: "iexemplar")
        print("hashed string \(strHash!)")
        let hashPWD =  strHash!.map { String(format: "%02hhx", $0) }.joined()
        print("hash string \(hashPWD)")
    }
    
    @IBAction func next_animate_action(_ sender: Any) {
        let SVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        obj.viewSlide_FromBottom_toTop(view: self.view.window!)
        self.navigationController?.pushViewController(SVC!, animated: false)

    }
    
}

