//
//  Common.swift
//  DemoActionSheet
//
//  Created by iexm01 on 14/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class Common: NSObject {

    class func showAlert (header: String, message: String) {
        let alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }

}
