//
//  ViewController.swift
//  DemoPKHUD
//
//  Created by Magesh Varadharajan on 09/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit
import PKHUD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PKHUD1(_ sender: Any) {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 3.0) { success in
            // Completion Handler
            print("PKHUD Finished")
        }
    }
    
    @IBAction func hudAction(_ sender: Any) {
         PKHUD.sharedHUD.contentView = PKHUDSuccessView()
         PKHUD.sharedHUD.show()
         PKHUD.sharedHUD.hide(afterDelay: 1.0) { success in
         // Completion Handler
            print("PKHUD Finished")
         }
    }
    
    @IBAction func hudTextAction(_ sender: Any) {
        PKHUD.sharedHUD.contentView = PKHUDTextView.init(text: "Please Wait")
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1.0) { success in
            // Completion Handler
            print("PKHUD Finished")
        }
    }
    
    @IBAction func hudErrorAction(_ sender: Any) {
        PKHUD.sharedHUD.contentView = PKHUDErrorView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1.0) { success in
            // Completion Handler
            print("PKHUD Finished")
        }
    }
}

