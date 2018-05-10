//
//  Type1ViewController.swift
//  DemoUITableView
//
//  Created by IXM on 10/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit

class Type1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableViewType1: UITableView!
    //var arrResponseDept: NSArray = []
    var arrResponseDept: [String] = ["Maths", "Cse", "Physics", "Chemistry", "IT", "Biology"]
    let cellReuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewType1.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableViewType1.delegate = self
        tableViewType1.dataSource = self
        tableViewType1.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backType1Action(_ sender: Any) {
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
    
    //MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier))!
       // var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell

        cell.textLabel?.text = self.arrResponseDept[indexPath.row]
        cell.backgroundColor = UIColor.brown
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
