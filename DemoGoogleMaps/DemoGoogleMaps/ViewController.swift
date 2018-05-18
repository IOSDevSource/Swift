//
//  ViewController.swift
//  DemoGoogleMaps
//
//  Created by iexm01 on 18/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - IBAction
    @IBAction func mapView_Action(sender: UIButton) {
        switch sender.tag {
        case 0: // map with annotation
            let NMVC = self.storyboard?.instantiateViewController(withIdentifier: "NormalMapViewController") as? NormalMapViewController
            self.navigationController?.pushViewController(NMVC!, animated: true)
            break
        case 1: // map with multiple annotation
            let NMVC = self.storyboard?.instantiateViewController(withIdentifier: "MultipleAnnViewController") as? MultipleAnnViewController
            self.navigationController?.pushViewController(NMVC!, animated: true)
            break
        case 2: // map with movable annotation
            let MAVC = self.storyboard?.instantiateViewController(withIdentifier: "MovableAnnViewController") as? MovableAnnViewController
            self.navigationController?.pushViewController(MAVC!, animated: true)
            break
        case 3: // map with route map
            let RVC = self.storyboard?.instantiateViewController(withIdentifier: "RouteMapViewController") as? RouteMapViewController
            self.navigationController?.pushViewController(RVC!, animated: true)
            break
        default:
            break
        }
    }
    
    
}

