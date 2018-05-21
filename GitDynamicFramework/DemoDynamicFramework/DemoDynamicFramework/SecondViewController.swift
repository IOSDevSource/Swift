//
//  SecondViewController.swift
//  DemoDynamicFramework
//
//  Created by iexm01 on 21/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import DemoGitFramework

class SecondViewController: UIViewController {

    let secObj = IxmGeneric()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back_animate_action(_ sender: UIButton) {
        secObj.viewSlide_FromRight_toLeft(view: self.view.window!)
        self.navigationController?.popViewController(animated: false)
    }
    
}
