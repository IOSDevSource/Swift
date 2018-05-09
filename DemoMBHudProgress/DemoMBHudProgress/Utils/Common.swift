//
//  Common.swift
//  DemoMBHudProgress
//
//  Created by Magesh Varadharajan on 08/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit

class Common: NSObject {
    class func showCommonProgressBar() -> Void {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mbProgressBar = MBProgressHUD.showAdded(to: (appDelegate.window?.rootViewController?.view)!, animated: true)
        mbProgressBar.isUserInteractionEnabled = false
        mbProgressBar.label.text = "Please Wait"
    }
    
    class func hideCommonProgressBar() -> Void {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        MBProgressHUD.hide(for: (appDelegate.window?.rootViewController?.view)!, animated: true)
    }
}
/*
 let mProgressBar = MBProgressHUD.showAdded(to: self.view, animated: true)
 mProgressBar.isUserInteractionEnabled = true
 mProgressBar.label.text = "Please Wait"
 */
