//
//  Type1ViewController.swift
//  DemoTableViewReorder
//
//  Created by IXM on 10/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit
import SwiftReorder
class Type1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableviewType1: UITableView!
    var arrResponseDept: [String] = ["Maths", "Cse", "Physics", "Chemistry", "IT", "Biology"]
    let cellReuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableviewType1.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableviewType1.delegate = self
        tableviewType1.dataSource = self
        tableviewType1.reorder.delegate = self
        tableviewType1.reorder.cellOpacity = 0.7
        tableviewType1.reorder.cellScale = 1.05
        tableviewType1.reorder.shadowOpacity = 0.5
        tableviewType1.reorder.shadowRadius = 20
        tableviewType1.reorder.shadowOffset = CGSize(width: 0, height: 10)
        tableviewType1.backgroundColor = UIColor.clear

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func type1BackAction(_ sender: Any) {
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
extension Type1ViewController {
    //MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let spacer = tableView.reorder.spacerCell(for: indexPath) {
            return spacer
        }
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier))!
        // var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.arrResponseDept[indexPath.row]
        cell.backgroundColor = UIColor.white
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
extension Type1ViewController: TableViewReorderDelegate {
    
    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = arrResponseDept[sourceIndexPath.row]
        arrResponseDept.remove(at: sourceIndexPath.row)
        arrResponseDept.insert(item, at: destinationIndexPath.row)
    }
    
}
