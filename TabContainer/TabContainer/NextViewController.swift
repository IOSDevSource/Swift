//
//  NextViewController.swift
//  TabContainer
//
//  Created by iexm01 on 15/03/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back_nextView_Action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
