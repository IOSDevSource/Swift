//
//  ViewController.swift
//  DemoUITableView
//
//  Created by IXM on 10/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segtype1" {
            print("Type1 View Controller")
        } else if segue.identifier == "segtype2" {
            print("Type2 View Controller")
        }
    }

}

