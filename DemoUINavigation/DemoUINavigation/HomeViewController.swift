//
//  HomeViewController.swift
//  DemoUINavigation
//
//  Created by Magesh Varadharajan on 07/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
    @IBAction func goNextAction(_ sender: UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController
        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    @IBAction func backHome(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
