//
//  IxmGeneric.swift
//  DemoGitFramework
//
//  Created by iexm01 on 21/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork

public class IxmGeneric: NSObject {
    
    //MARK: - Sample
    public func Test() {
        print("First dynamic framework")
    }
    
    //MARK: - Alert
    public func showAlert (header: String, message: String, view: UIViewController ,callback : @escaping (NSString?, NSString?) -> ()) {
        let alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
            callback("OK",nil)
        }))
        view.present(alert, animated: true){}
    }
    
    //MARK: - Device Type
    public func deviceType() -> String {
        var strDeviceType = ""
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        let screenWidth = screenSize.width
        
        print("screen height \(screenHeight)")
        if screenHeight > 480.0 && screenHeight <= 568.0 {
            strDeviceType = "iPhone5"
        } else if screenHeight > 568.0 && screenHeight <= 667.0 {
            strDeviceType = "iPhone6"
        } else if screenHeight > 667.0 && screenHeight <= 736.0 {
            strDeviceType = "iPhone6plus"
        } else {
            strDeviceType = "iPhoneX"
        }
        if screenHeight == 1024 && screenWidth == 768 {
            strDeviceType = "iPad"
        } else if screenHeight == 2048 && screenWidth == 1536 {
            strDeviceType = "iPadRetina"
        }
        return strDeviceType
    }
    
    //MARK: - Current Year
    public func currentYear() -> Int {
        let currentYear = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy"
        let currentYearString: String = formatter1.string(from: currentYear)
        let yearINT: Int = (currentYearString as NSString).integerValue
        return yearINT
    }
    
    //MARK: - Current Month
    public func currentMonth() -> Int {
        let currentMonth = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MM"
        let currentMonthString: String = formatter1.string(from: currentMonth)
        let monthINT: Int = (currentMonthString as NSString).integerValue
        return monthINT
    }
    
    //MARK: - Current Date
    public func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    //MARK: - Battery Level
    public func getBatteryPercentage() -> Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        var batterylvl: Int = Int(UIDevice.current.batteryLevel)
        print("batterylevel==\(batterylvl)")
        batterylvl = 100
        return batterylvl
    }
    
    //MARK: - Animation
    public func viewSlide_FromLeft_toRight(view: UIView) {
        let transition = CATransition()
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.layer.add(transition, forKey: nil)
    }
    
    public func viewSlide_FromRight_toLeft (view: UIView) {
        let transition = CATransition()
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.layer.add(transition, forKey: kCATransition)
    }
    
    public func viewSlide_FromBottom_toTop (view: UIView) {
        let transition = CATransition()
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        view.layer.add(transition, forKey: kCATransition)
    }
    
    public func viewSlide_FromTop_toBottom (view: UIView) {
        let transition = CATransition()
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        view.layer.add(transition, forKey: kCATransition)
    }
    
    public func viewFadein (view: UIView) {
        let transition = CATransition()
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFade
        view.layer.add(transition, forKey: nil)
    }
    
    public func reachabilityChanged() -> Bool {
        let reach = Reachability(hostname: "www.google.com")
        if (reach?.isReachable())! {
            print("Notification Says Reachable")
            return true
        } else {
            print("Notification Says Unreachable")
            return false
        }
    }
    
    public func md5(string: String) -> Data? {
        guard let messageData = string.data(using:String.Encoding.utf8) else { return nil }
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData
    }
    
    //MARK: - WIFI Configuration
    public func fetchSSIDInfo() ->  String? {
        if let interfaces = CNCopySupportedInterfaces() {
            for i in 0..<CFArrayGetCount(interfaces){
                let interfaceName: UnsafeRawPointer = CFArrayGetValueAtIndex(interfaces, i)
                let rec = unsafeBitCast(interfaceName, to: AnyObject.self)
                let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)" as CFString)
                
                if let unsafeInterfaceData = unsafeInterfaceData as? Dictionary<AnyHashable, Any> {
                    return unsafeInterfaceData["SSID"] as? String
                }
            }
        }
        return nil
    }
}
