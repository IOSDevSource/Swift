//
//  ViewController.swift
//  DemoMQTTJSON
//
//  Created by IXM on 16/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit
import CocoaMQTT

class ViewController: UIViewController {

    var mqtt: CocoaMQTT?
    let MQTT_PORT = 1883
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("***** View Will Appear *****")
        super.viewWillAppear(animated)
        selfSignedSSLSetting()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.didReceiveMemoryWarning()
        mqtt?.disconnect()
    }
    
    // MARK: - MQTT Certificate Verification
    func selfSignedSSLSetting() {
        let clientID = "CocoaMQTT-IOS-" + "SIRAJ_DEMO_SAMPLE"
        mqtt = CocoaMQTT(clientID: clientID, host: "52.36.175.99", port: UInt16(MQTT_PORT))
        mqtt!.username = ""
        mqtt!.password = ""
        mqtt!.keepAlive = 60
        mqtt!.delegate = self as? CocoaMQTTDelegate
        mqtt!.enableSSL = false
        mqtt!.autoReconnect = true
        
        let clientCertArray = getClientCertFromP12File(certName: "cert-key-vm", certPassword: "123456")
        
        var sslSettings: [String: NSObject] = [:]
        sslSettings[kCFStreamSSLCertificates as String] = clientCertArray
        
        mqtt!.sslSettings = sslSettings
        print(mqtt!.sslSettings as Any)
        if (mqtt!.sslSettings! != [:]) {
            mqtt!.connect()
        } else {
            print("ssl error")
        }
    }

    func getClientCertFromP12File(certName: String, certPassword: String) -> CFArray? {
        // get p12 file path
        let resourcePath = Bundle.main.path(forResource: certName, ofType: ".p12")
        
        guard let filePath = resourcePath, let p12Data = NSData(contentsOfFile: filePath) else {
            print("Failed to open the certificate file: \(certName).p12")
            return nil
        }
        
        // create key dictionary for reading p12 file
        let key = kSecImportExportPassphrase as String
        let options : NSDictionary = [key: certPassword]
        
        var items : CFArray?
        let securityError = SecPKCS12Import(p12Data, options, &items)
        
        guard securityError == errSecSuccess else {
            if securityError == errSecAuthFailed {
                print("ERROR: SecPKCS12Import returned errSecAuthFailed. Incorrect password?")
            } else {
                print("Failed to open the certificate file: \(certName).p12")
            }
            return nil
        }
        
        guard let theArray = items, CFArrayGetCount(theArray) > 0 else {
            return nil
        }
        
        let dictionary = (theArray as NSArray).object(at: 0)
        guard let identity = (dictionary as AnyObject).value(forKey: kSecImportItemIdentity as String) else {
            return nil
        }
        let certArray = [identity] as CFArray
        
        return certArray
    }
    //MARK: - User Defined Method
    func parseControllerDetails(responseString: String) -> Void {
        var dictonary = NSDictionary()
        if let data = responseString.data(using: String.Encoding.utf8) {
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                print(dictonary)
                print(dictonary.object(forKey: "userName") as! String)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - MQTT Delegate Methods
extension ViewController: CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didConnect host: String, port: Int) {
        print("didConnect \(host):\(port)")
    }
    
    // Optional ssl CocoaMQTTDelegate
    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(true)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("didConnectAck: \(ack)，rawValue: \(ack.rawValue)")
        if ack == .accept {
            print("connect ack")
           // let oID = UserDefaults.standard.object(forKey: RORGANIZATIONID) as! String
            let subTopic = "DEMOIOS"
            mqtt.subscribe(subTopic)
        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("didPublishMessage with message: \(message.string!)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("didPublishAck with id: \(id)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16 ) {
        print("didReceivedMessage: \(message.string!) with id \(id)")
        NSLog("didReceivedMessage: \(message.string!) with id \(id)")
        parseControllerDetails(responseString: message.string!)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        print("didSubscribeTopic to \(topic)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("didUnsubscribeTopic to \(topic)")
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print("didPing")
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print("didReceivePong")
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("mqttDidDisconnect")
    }
    
    func _console(_ info: String) {
        print("Delegate: \(info)")
    }
}

