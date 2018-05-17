//
//  ViewController.swift
//  DemoSocket
//
//  Created by IXM on 17/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Var Declaration and View Life Cycle
    let host = "192.168.4.1"
    let port = 80
    var client: TCPClient?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.strSocketTimeout = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapMeAction(_ sender: Any) {
        let dispatchTimeout = DispatchTime.now() + .seconds(10)
        DispatchQueue.main.asyncAfter(deadline: dispatchTimeout) {
            print("timeout")
            if self.appDelegate.strSocketTimeout != "YES" {
                print("Connection Timeout")
            }
            self.client?.close()
        }
        let dispatchTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            print("entered")
            self.client = TCPClient(address: self.host, port: Int32(self.port))
            switch self.client?.connect(timeout: 2) {
            case .success?:
                print("Connected to host \(String(describing: self.client?.address))")
                let socketInput = "ADD,IEXEMPLER,9943080950"
                print("SOCKET INPUT \(socketInput)")
                switch self.client?.send(string: socketInput) {
                case .success?:
                    guard let data = self.client?.read(1024*10) else { return }
                    if let response = String(bytes: data, encoding: .utf8) {
                        print(response)
                        if response as String == "SUCCESS" {
                            print("configuration success")
                            self.appDelegate.strSocketTimeout = "YES"
                            print("Navigate to next screen")
                        }
                    }
                case .failure(let error)?:
                    self.appDelegate.strSocketTimeout = "YES"
                    print("configuration failure")
                    print(String(describing: error))
                case .none:
                    self.appDelegate.strSocketTimeout = "YES"
                    print("Socket connection failed")
                }
            case .failure(let error)?:
                print("failure")
                self.appDelegate.strSocketTimeout = "YES"
                print(String(describing: error))
            case .none:
                self.appDelegate.strSocketTimeout = "YES"
                print("Socket connection failed")
            }
        }
    }
    
}

