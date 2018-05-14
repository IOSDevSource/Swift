//
//  ViewController.swift
//  DemoActionSheet
//
//  Created by iexm01 on 11/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionSheet_action(sender: UIButton) {
        switch sender.tag {
        case 0: // action sheet with UIAlertView
            let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
            let sendButton = UIAlertAction(title: "Send now", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
            })
            let  deleteButton = UIAlertAction(title: "Delete forever", style: .destructive, handler: { (action) -> Void in
                print("Delete button tapped")
            })
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
                print("Cancel button tapped")
            })
            alertController.addAction(sendButton)
            alertController.addAction(deleteButton)
            alertController.addAction(cancelButton)
//            alertController.view.tintColor = UIColor.white
//            alertController.view.backgroundColor = UIColor.black
            self.present(alertController, animated: true, completion: nil)
            break
        case 1: // alertview
            let alert = UIAlertController(title: "This is an alert!", message: "Using UIAlertController", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (okSelected) -> Void in
                print("Ok Selected")
            }
            let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (cancelSelected) -> Void in
                print("Cancel Selected")
            }
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil)
            break
        case 2: // common class alertview
            Common.showAlert(header: "AlertView", message: "Common class AlertView")
            break
        default:
            break
        }
    }
}

