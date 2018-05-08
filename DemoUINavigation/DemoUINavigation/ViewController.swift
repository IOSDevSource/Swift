//
//  ViewController.swift
//  DemoUINavigation
//
//  Created by Magesh Varadharajan on 07/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - IBAction
    @IBAction func goHomeAction(_ sender: UIButton) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.navigationController?.pushViewController(homeVC!, animated: true)
    }
}

