//
//  Type2ViewController.swift
//  DemoUITableView
//
//  Created by IXM on 10/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit
class departmentViewCell: UITableViewCell {
    
    @IBOutlet var lblDept: UILabel!
    @IBOutlet var imgViewDept: UIImageView!
}
class Type2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableViewType2: UITableView!
    var arrResponseDept: [String] = ["Maths", "Cse", "Physics", "Chemistry", "IT", "Biology"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewType2.delegate = self
        tableViewType2.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func type2Action(_ sender: Any) {
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
    /*
     let cell : departmentViewCell = tableView.dequeueReusableCell(withIdentifier: "departmentViewCell")! as! departmentViewCell
     cell.deptName.text = (self.arrResponseDept[indexPath.row] as AnyObject).object(forKey: RNAME) as? String
 */
    //MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : departmentViewCell = tableView.dequeueReusableCell(withIdentifier: "departmentViewCell")! as! departmentViewCell
        cell.lblDept.text = self.arrResponseDept[indexPath.row]
        cell.imgViewDept.image = UIImage(named: "DeptSel")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected Cell \(indexPath.row)")
        let selectedTag = indexPath.row
        print("Selected Cell \(selectedTag)")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrResponseDept.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

}
