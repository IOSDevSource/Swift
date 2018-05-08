//
//  HomeViewController.swift
//  DemoDelegateProtocol
//
//  Created by Magesh Varadharajan on 07/05/18.
//  Copyright © 2018 iExemplar Software India. All rights reserved.
//

import UIKit
protocol MyHomeProtocol {
    func setResultOfHome(valueSent: String)
}
class HomeViewController: UIViewController {
    //MARK: - Variable and Outlet Declaration
    var delegate:MyHomeProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        let strDemoVal = "Welcome to protocol"
        delegate?.setResultOfHome(valueSent: strDemoVal)
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
