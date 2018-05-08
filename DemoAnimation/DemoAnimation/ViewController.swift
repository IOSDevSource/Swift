//
//  ViewController.swift
//  DemoAnimation
//
//  Created by iexm01 on 08/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var flipViewOne: UIView!
    @IBOutlet var flipViewTwo: UIView!
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        flipViewTwo.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - IBAction
    @IBAction func nextView_Action(_ sender: UIButton) {
        let SVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        Common.viwwLeft_ToRight(view: (self.navigationController?.view)!)
        self.navigationController?.pushViewController(SVC!, animated: false)
    }
    
    @IBAction func flipView_Action(_ sender: UIButton) {
        switch sender.tag {
        case 0: // flip view 1
            /******************* Add any functionality after the animation is completed *****************/
//            UIView.transition(with: self.view, duration: 1, options: .transitionFlipFromRight, animations: {() -> Void in
//                self.flipViewOne.isHidden = true
//                self.flipViewTwo.isHidden = false
//            }, completion: nil)
            /*******************************************************************************************/
            
            UIView.transition(from: flipViewOne, to: flipViewTwo, duration: 1, options: [.transitionFlipFromRight], completion: nil)
            break
        case 1: // flip view 2
            /******************* Add any functionality after the animation is completed *****************/
//            UIView.transition(with: self.view, duration: 1, options: .transitionFlipFromLeft, animations: {() -> Void in
//                self.flipViewOne.isHidden = false
//                self.flipViewTwo.isHidden = true
//            }, completion: nil)
            /*******************************************************************************************/
            
            UIView.transition(from: flipViewTwo, to: flipViewOne, duration: 1, options: [.transitionFlipFromLeft], completion: nil)
            break
        default:
            break
        }
    }
    
}

