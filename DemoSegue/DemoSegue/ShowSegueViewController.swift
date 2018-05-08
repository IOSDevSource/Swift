//
//  ShowSegueViewController.swift
//  DemoSegue
//
//  Created by iexm01 on 07/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ShowSegueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back_show_action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
