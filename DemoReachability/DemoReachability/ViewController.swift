//
//  ViewController.swift
//  DemoReachability
//
//  Created by IXM on 14/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let network: NetworkManager = NetworkManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.isReachable { _ in
            print("Net Connection OK")
        }
        network.reachability.whenReachable = { _ in
            print("Net Connection Came")
        }
        network.reachability.whenUnreachable = { _ in
            print("Network Connection Gone")
        }
        NetworkManager.isUnreachable { _ in
            print("No Network Connection")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

