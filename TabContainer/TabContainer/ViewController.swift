//
//  ViewController.swift
//  TabContainer
//
//  Created by iexm01 on 15/03/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variable Declaration
    var selectedTag = 0
    
    //MARK: - Child View Controller
    private lazy var firstViewController: FirstViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        
        // Add View Controller as Child View Controller
//        self.add(asChildViewController: viewController)
            self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var secondViewController: SecondViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // Add View Controller as Child View Controller
//        self.add(asChildViewController: viewController)
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var thirdViewController: ThirdViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        // Add View Controller as Child View Controller
        //        self.add(asChildViewController: viewController)
        self.addChildViewController(viewController)
        return viewController
    }()

    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - User Defined Methods
    func updateView() {
        if selectedTag == 0 {
            add(asChildViewController: firstViewController)
            remove(asChildViewController: secondViewController)
            remove(asChildViewController: thirdViewController)
        } else if selectedTag == 1 {
            remove(asChildViewController: firstViewController)
            add(asChildViewController: secondViewController)
            remove(asChildViewController: thirdViewController)
        } else if selectedTag == 2 {
            remove(asChildViewController: firstViewController)
            remove(asChildViewController: secondViewController)
            add(asChildViewController: thirdViewController)
        }
    }
    
    
    // MARK: - Helper Methods
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
//        viewController.view.frame = view.bounds
        viewController.view.frame = CGRect(x: CGFloat(0), y: CGFloat(80), width: CGFloat(self.view.frame.size.width), height: CGFloat(self.view.frame.size.height))
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }

    //MARK: - IBAction
    @IBAction func selectMenu_Tab_Action(sender: UIButton) {
        switch sender.tag {
        case 0: // First
            if selectedTag != 0 {
                selectedTag = 0
                updateView()
            }
            break
        case 1: // Second
            if selectedTag != 1 {
                selectedTag = 1
                updateView()
            }
            break
        case 2: // Third
            if selectedTag != 2 {
                selectedTag = 2
                updateView()
            }
            break
        default:
            break
        }
    }
}

