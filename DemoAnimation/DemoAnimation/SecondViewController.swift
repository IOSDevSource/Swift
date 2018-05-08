//
//  SecondViewController.swift
//  DemoAnimation
//
//  Created by iexm01 on 08/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

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
    @IBAction func next_secondView_action(sender: UIButton) {
        switch sender.tag {
        case 0: // Next
            let TVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
            Common.viwwFadein(view: (self.navigationController?.view)!)
            self.navigationController?.pushViewController(TVC!, animated: false)
            break
        case 1: // Back
            Common.viwwRight_ToLeft(view: (self.navigationController?.view)!)
            self.navigationController?.popViewController(animated: false)
            break
        default:
            break
        }
    }
}
