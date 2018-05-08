//
//  NextViewController.swift
//  DemoUINavigation
//
//  Created by Magesh Varadharajan on 07/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit
class NextViewController: UIViewController {

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - IBAction
    @IBAction func backNextAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func backLaunchAction(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 0: // back to launch using loop
            let allViewController: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
            for aviewcontroller : UIViewController in allViewController {
                if aviewcontroller.isKind(of: ViewController.self) {
                    self.navigationController?.popToViewController(aviewcontroller, animated: true)
                }
            }
            break
        case 1: // back to launch using new stack
            let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController")
            let newStack = [destViewController]
            self.navigationController!.setViewControllers(newStack, animated: false)
            break
        default:
            break
        }
    }
    
}
