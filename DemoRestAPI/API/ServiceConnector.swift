//
//  ServiceConnector.swift
//  DemoRestAPI
//
//  Created by IXM on 09/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash


class ServiceConnector: NSObject {
    static var responseDict = NSDictionary()
    static var statusCode: Int?
    class func serviceConnectorGET(_methodName: String, callback: @escaping (NSDictionary?, NSString?, Int?) ->())
        {
            let baseURL = "http://api.plos.org/search?q=title:%22Drosophila%22%20AND%20body:%22RNA%22&fl=id,abstract&wt=xml"
            NSLog("baseURL \(baseURL)")
            //var statusC = ""
            print(baseURL)
            var request = URLRequest(url: NSURL.init(string: baseURL)! as URL)
            request.httpMethod = "GET"
            Alamofire.request(request).response {
                response in
                print(response)
                statusCode = response.response?.statusCode
                print(statusCode!)
                print(response.data!)
                let xml = SWXMLHash.parse(response.data!)
                print(xml)
                print(xml["response"])
                if statusCode! == 200 && (response.error == nil) {
                    print("Success")
                    callback(responseDict,nil,statusCode)
                } else {
                    print(response.error!)
                    let statusC = response.error?.localizedDescription
                    callback(nil,statusC as NSString?,statusCode)
                }
            }
        }
    
   }
//var dics = XMLReader.dictionary(forXMLData: urlData, error: nil)
//http://api.plos.org/search?q=title:%22Drosophila%22%20AND%20body:%22RNA%22&fl=id,abstract&wt=xml
/*
 Alamofire.request(.GET, "http://my-web-service-domain.com", parameters: nil)
 .response { (request, response, data, error) in
 println(data) // if you want to check XML data in debug window.
 var xml = SWXMLHash.parse(data!)
 println(xml["UserDTO"]["FilmID"].element?.text) // output the FilmID element.
 }
 */
