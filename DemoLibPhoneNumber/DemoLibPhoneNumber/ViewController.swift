//
//  ViewController.swift
//  DemoLibPhoneNumber
//
//  Created by IXM on 17/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit
import libPhoneNumber_iOS

class ViewController: UIViewController {

     //let textField: UITextField = NBTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func libPhoneAction(_ sender: Any) {
        let phoneUtil = NBPhoneNumberUtil()
        do {
            let phoneNumber: NBPhoneNumber = try phoneUtil.parse("+919629594137", defaultRegion: "IN")
            let formattedString: String = try phoneUtil.format(phoneNumber, numberFormat: .E164)
            NSLog("[%@]", formattedString)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func libWithoutCountryCode(_ sender: Any) {
        let phoneUtil = NBPhoneNumberUtil()
        do {
            let phoneNumber: NBPhoneNumber = try phoneUtil.parse("9629594137", defaultRegion: "IN")
            let formattedString: String = try phoneUtil.format(phoneNumber, numberFormat: .E164)
            NSLog("[%@]", formattedString)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func libWithDonesticCode(_ sender: Any) {
        let phoneUtil = NBPhoneNumberUtil()
        do {
            let phoneNumber: NBPhoneNumber = try phoneUtil.parse("09629594137", defaultRegion: "IN")
            let formattedString: String = try phoneUtil.format(phoneNumber, numberFormat: .E164)
            NSLog("[%@]", formattedString)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}

