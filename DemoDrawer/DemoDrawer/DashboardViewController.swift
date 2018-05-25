//
//  DashboardViewController.swift
//  DemoDrawer
//
//  Created by iexm01 on 25/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class DashboardViewController: SliderLibViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back_dashboard_action(_ sender: UIButton) {
        let destViewController : SliderLibViewController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! SliderLibViewController
        let newStack = [destViewController]
        appDelegate.selectedMenu = 0
        self.navigationController!.setViewControllers(newStack, animated: false)
    }
    
    @IBAction func menu_dashboard_action(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender: sender)
    }
}
