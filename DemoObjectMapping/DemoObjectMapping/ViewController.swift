//
//  ViewController.swift
//  DemoObjectMapping
//
//  Created by iexm01 on 10/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        objectMapperSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func objectMapperSetup() {
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
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
    }
    
 /*   @IBAction func getAPIAction(sender: UIButton) {
        switch sender.tag {
        case 0: // working
            let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
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
            break
        case 1: // not working
            ServiceConnector.serviceConnectorGET(_methodName: "") {
                responseObject,error,statusCode in
                if (error == nil) {
                    let code: Int = statusCode!
                    NSLog("\(code)")
                    print(code)
                    print(responseObject as Any)
//                    let res = responseObject as WeatherResponse
                } else {
                    print("error = \(String(describing: error))")
                }
            }
            break
        default:
            break
        }
    } */

}

