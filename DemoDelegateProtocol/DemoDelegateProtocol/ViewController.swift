//
//  ViewController.swift
//  DemoDelegateProtocol
//
//  Created by Magesh Varadharajan on 07/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyHomeProtocol {
   
    //MARK: - Variable and Outlet Declaration
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 3. Before displaying the value check if it contains data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - IBAction
    @IBAction func goHomeAction(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeVC?.delegate = self
        self.navigationController?.pushViewController(homeVC!, animated: true)
    }
    
    //MARK: Custom Protocol Stuff
    func setResultOfHome(valueSent: String) {
        print(valueSent)
    }
}

