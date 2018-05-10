//
//  ServiceConnector.swift
//  DemoObjectMapping
//
//  Created by iexm01 on 10/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ServiceConnector: NSObject {
    static var responseDict = NSDictionary()
    static var statusCode: Int?
   
    class func serviceConnectorGET(_methodName: String, callback: @escaping (NSDictionary?, NSString?, Int?) ->())
    {
        let baseURL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        NSLog("baseURL \(baseURL)")
        //var statusC = ""
        print(baseURL)
        var request = URLRequest(url: NSURL.init(string: baseURL)! as URL)
        request.httpMethod = "GET"
        Alamofire.request(request).response { response in
            print(response)
            statusCode = response.response?.statusCode
            print(statusCode!)
            print(response.data!)
            
            if let string = String(data: response.data!, encoding: .utf8) {
                print(string)
                if let data = string.data(using: .utf8) {
                    do {
                        responseDict = (try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary)!
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                print("not a valid UTF-8 sequence")
            }

//            responseDict = (response.result.value as? NSDictionary)!
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
    
    
    /*
 
     Alamofire.request(URL).responseObject { (response: DataResponse<WeatherResponse>) in
     let weatherResponse = response.result.value
     print(weatherResponse!.location as Any)
     if let threeDayForecast = weatherResponse?.threeDayForecast {
     for forecast in threeDayForecast {
     print(forecast.day as Any)
     print(forecast.temperature as Any)
     }
     }
     }
 
 */
}
