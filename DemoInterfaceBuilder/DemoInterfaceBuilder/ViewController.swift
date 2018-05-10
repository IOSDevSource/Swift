//
//  ViewController.swift
//  DemoInterfaceBuilder
//
//  Created by iexm01 on 10/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        widgetSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func widgetSetup() {
        let testButton = CustomButton()
        testButton.frame = CGRect.init(x: 100, y: self.view.frame.size.height - 100, width: 175, height: 40)
        testButton.setTitle("HelloWOrld", for: .normal)
        self.view.addSubview(testButton)
    }

}

