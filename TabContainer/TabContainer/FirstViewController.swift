//
//  FirstViewController.swift
//  TabContainer
//
//  Created by iexm01 on 15/03/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("First View Controller Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("First View Controller Will Disappear")
    }
    @IBAction func next_Action(_ sender: UIButton) {
        let NVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController
        self.navigationController?.pushViewController(NVC!, animated: true)

    }
    
}
