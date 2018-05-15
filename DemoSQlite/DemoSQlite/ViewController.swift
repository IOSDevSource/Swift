//
//  ViewController.swift
//  DemoSQlite
//
//  Created by iexm01 on 15/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    @IBAction func dbAction(sender: UIButton) {
        switch sender.tag {
        case 0: // insert
            let dict: NSMutableDictionary = ["USERNAME": "Anitha", "PASSWORD": "111111"]
            print(dict)
            let insertStatus: String = DBHandler.insert_UserDetails_inDB(dict: dict)
            print(insertStatus)
            break
        case 1: // fetch
            let arr: NSMutableArray = DBHandler.get_userDetails_FromDB()
            print("user array list == \(arr)")
            break
        case 2: // update
            let strUpdateStatus = DBHandler.update_userDetails_inDB(columnName: "PASSWORD", updateEmpID: "1", changeValue: "123456")
            print("update status == \(strUpdateStatus)")
            break
        case 3: // delete
            let strDeleteStatus = DBHandler.delete_userDetail_FromDB(strID: "1")
            print("delete status == \(strDeleteStatus)")
            break
        case 4: // Inner join
            let arr = DBHandler.getProjectDetails_ForResource_FromDB(strResourceID: "1")
            print("arr details == \(arr)")
        default:
            break
        }
    }

}

