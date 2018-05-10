//
//  ViewController.swift
//  DemoRestAPI
//
//  Created by IXM on 09/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

class ViewController: UIViewController {
     static var statusCode: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getAPILoad(_ sender: Any) {
        let baseURL = "http://api.plos.org/search?q=title:%22Drosophila%22%20AND%20body:%22RNA%22&fl=id,abstract&wt=xml"
        NSLog("baseURL \(baseURL)")
        print(baseURL)
        var request = URLRequest(url: NSURL.init(string: baseURL)! as URL)
        request.httpMethod = "GET"
        Alamofire.request(request).response {
            response in
            print(response)
            ViewController.statusCode = response.response?.statusCode
            print(ViewController.statusCode!)
            print(response.data!)
            if ViewController.statusCode! == 200 && (response.error == nil) {
                print("Success")
            }
            let xml = SWXMLHash.parse(response.data!)
            print(xml)
            print(xml["response"])
        }
    }
    
    @IBAction func getAPIServiceConn(_ sender: Any) {
        ServiceConnector.serviceConnectorGET(_methodName: "") {
            responseObject,error,statusCode in
            if (error == nil) {
                let code: Int = statusCode!
                NSLog("\(code)")
                print(code)
            } else {
                print("error = \(String(describing: error))")
            }
        }
    }
}

