//
//  ViewController.swift
//  DemoSegue
//
//  Created by iexm01 on 07/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextAction_performSegue(_ sender: UIButton) {
        switch sender.tag {
        case 0: // show Segue
            self.performSegue(withIdentifier: "segueShow", sender: nil)
            break
        case 1: // show Detail Segue
            self.performSegue(withIdentifier: "segueDetail", sender: nil)
            break
        case 2: // present modally segue
            self.performSegue(withIdentifier: "seguePresent", sender: nil)
            break
        case 3: // present as popover segue
            self.performSegue(withIdentifier: "showPopoverSegue", sender: nil)
//            let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopOverSegueViewController")
//            popController.modalPresentationStyle = UIModalPresentationStyle.popover
//            popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
//            popController.popoverPresentationController?.delegate = self
//            popController.popoverPresentationController?.sourceView = sender // button
//            popController.popoverPresentationController?.sourceRect = sender.bounds
//            self.present(popController, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    // UIPopoverPresentationControllerDelegate method
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Force popover style
        return UIModalPresentationStyle.popover
    }

}

