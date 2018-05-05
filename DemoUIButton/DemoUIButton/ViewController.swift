//
//  ViewController.swift
//  DemoUIButton
//
//  Created by Magesh Varadharajan on 05/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variable and Outlet Declarations
    @IBOutlet var btnCustomCorner: UIButton!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        widgetConfiguration()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - User Defined Method
    func widgetConfiguration() -> Void {
        btnCustomCorner.layer.cornerRadius = 5.0
        btnCustomCorner.layer.borderWidth = 2.0
        btnCustomCorner.layer.borderColor = UIColor.blue.cgColor

        //Progrmatically button creation
        let btnLogin = UIButton(type: UIButtonType.custom) as UIButton
        let yPostion:CGFloat = (self.view.frame.size.height - 45 - 20) 
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        let xPostion:CGFloat = (self.view.frame.size.width-150) / 2
        
        btnLogin.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        btnLogin.backgroundColor = UIColor.lightGray
        btnLogin.setTitle("Login", for: UIControlState.normal)
        btnLogin.tintColor = UIColor.black
        btnLogin.addTarget(self, action: #selector(ViewController.loginAction(_:)), for: .touchUpInside)
        self.view.addSubview(btnLogin)
    }
    
    @objc func loginAction(_ sender:UIButton!) {
        print("Login Button tapped")
    }
    
    //MARK: - IBAction
    @IBAction func defaultAction(_ sender: Any) {
        print("Default Button Tapped")
    }
    
    @IBAction func customAction(_ sender: Any) {
        print("Custom Button Tapped")
    }
    
    @IBAction func customCornerAction(_ sender: Any) {
        print("Custom Corner Tapped")
    }
    
    @IBAction func tagAction(_ sender: UIButton) {
        print("btnTag==\(sender.tag)")
        switch sender.tag {
        case 0: // Tag 1
            print("Tag 1 Tapped")
            break
        case 1:
            print("Tag 2 Tapped")
            break
        case 2:
            print("Tag 3 Tapped")
            break
        case 3:
            print("Tag 4 Tapped")
            break
        default:
            break
        }
    }
    
    @IBAction func changeTickAction(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "chkrect") {
            print("Image Rect Found")
            sender.setImage(UIImage(named: "chkround"), for: UIControlState.normal)
            return
        }
        sender.setImage(UIImage(named: "chkrect"), for: UIControlState.normal)
    }
    
}

