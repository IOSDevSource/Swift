//
//  ViewController.swift
//  DemoJSONFile
//
//  Created by IXM on 15/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        // way 1 calling
        readFileFromBundle()
       
        // way 2 calling
        var dictProductInfo = NSDictionary()
        dictProductInfo = loadJson(forFilename: "test")!
        print(dictProductInfo)
        var arrPerson = NSArray()
        arrPerson = dictProductInfo.object(forKey: "person") as! NSArray
        print(arrPerson)
        // way 3 calling
        parseo()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Way 1
    func readFileFromBundle() -> Void {
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
                    print(person)
                    print(person.count)
                }
            } catch {
                // handle error
                print("Error while fetching and reading file")
            }
        }
    }
    // Way 2
    func loadJson(forFilename fileName: String) -> NSDictionary? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    return dictionary
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
            print("Error!! Unable to load  \(fileName).json")
        }
        
        return nil
    }
    
    // Fetch JSON file from Document Directory
    func parseo(){
        let documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!
        let destinationFileUrl = documentsUrl.appendingPathComponent("test.json")
        if let data = NSData(contentsOf: destinationFileUrl) {
            do {
                var dictProductInfo = NSDictionary()
                dictProductInfo = (try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary)!
               // var dictProductInfo = NSDictionary()
                print(dictProductInfo)
            } catch {
                print("Error!! Unable to parse  \("test").json")
            }
        }
    }
}

