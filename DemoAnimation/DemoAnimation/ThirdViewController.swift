//
//  ThirdViewController.swift
//  DemoAnimation
//
//  Created by iexm01 on 08/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

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
    @IBAction func back_thirdView_action(sender: UIButton) {
        switch sender.tag {
        case 0: // Back
            Common.viwwFromTop(view: (self.navigationController?.view)!)
            self.navigationController?.popViewController(animated: false)
            break
        case 1: // Back to Home Screen
            let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController")
            let newStack = [destViewController]
            Common.viwwFromBottom(view: (self.navigationController?.view)!)
            self.navigationController!.setViewControllers(newStack, animated: false)
            break
        default:
            break
        }
    }

}
