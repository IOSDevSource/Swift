//
//  ViewController.swift
//  DemoDrawer
//
//  Created by iexm01 on 25/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: SliderLibViewController, UIGestureRecognizerDelegate {

    var swipeGesture = UISwipeGestureRecognizer()
    @IBOutlet var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeGesture.delegate = self
        swipeGesture.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuAction(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender: sender)
    }
    
    //MARK: - UISwipeGestureDelegate Method
    @objc func handleSwipe(_ sender: UITapGestureRecognizer) {
        print("pan gesture called")
        onSlideMenuButtonPressed(sender: menuButton)
    }
}

