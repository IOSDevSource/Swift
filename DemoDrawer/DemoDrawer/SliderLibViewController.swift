//
//  SliderLibViewController.swift
//  AirFipro
//
//  Created by ixm1 on 11/13/17.
//  Copyright © 2017 iexemplar. All rights reserved.
//

import UIKit

class SliderLibViewController: UIViewController, SlideMenuDelegate {

    //MARK: - Variable Declaration
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - User defined Methods
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("Home\n", terminator: "")
            self.openViewControllerBasedOnIdentifier("ViewController")
            appDelegate.selectedMenu = 0
            break
        case 1:
            print("Dashboard\n", terminator: "")
            self.openViewControllerBasedOnIdentifier("DashboardViewController")
            appDelegate.selectedMenu = 1
            break
        case 2:
            print("Setting\n", terminator: "")
//            self.openViewControllerBasedOnIdentifier(REPORTTYPEVIEW)
            appDelegate.selectedMenu = 2
            break
        case 3:
            print("Report\n", terminator: "")
//            self.openViewControllerBasedOnIdentifier(REPORTTYPEVIEW)
            appDelegate.selectedMenu = 3
            break
        case 4:
            print("Notification\n", terminator: "")
//            self.openViewControllerBasedOnIdentifier(NOTILISTVIEW)
            appDelegate.selectedMenu = 4
            break
        case 5:
            print("Feedback\n", terminator: "")
//            self.openViewControllerBasedOnIdentifier(FEEDBACKVIEW)
            appDelegate.selectedMenu = 5
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier: String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        let newStack = [destViewController]
        self.navigationController!.setViewControllers(newStack, animated: false)
    }
    
    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        //        UIColor.white.setFill() Sri
        UIColor.init(red: 228.0/255.0, green: 228.0/255.0, blue: 228.0/255.0, alpha: 1).setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage;
    }
    
    @objc func onSlideMenuButtonPressed(sender : UIButton) {
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            sender.tag = 0;
            let viewMenuBack : UIView = view.subviews.last!
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : DrawerViewController = self.storyboard!.instantiateViewController(withIdentifier: "DrawerViewController") as! DrawerViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }

}
