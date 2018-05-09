//
//  ViewController.swift
//  DemoMBHudProgress
//
//  Created by Magesh Varadharajan on 08/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startAction(_ sender: Any) {
        let mProgressBar = MBProgressHUD.showAdded(to: self.view, animated: true)
        mProgressBar.isUserInteractionEnabled = false
        mProgressBar.label.text = "Please Wait"
    }
    
    @IBAction func commonActionStart(_ sender: Any) {
        //Common.showCommonProgressBar()
        Common.showCommonProgressBar()
    }
    @IBAction func stopAction(_ sender: Any) {
       MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    @IBAction func commonStopAction(_ sender: Any) {
        Common.hideCommonProgressBar()
    }
    /*
     let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
     loadingNotification?.mode = MBProgressHUDModeIndeterminate
     loadingNotification?.labelText = "Please Wait"
    */
}

