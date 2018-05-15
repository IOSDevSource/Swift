//
//  AppDelegate.swift
//  DemoJSONFile
//
//  Created by IXM on 15/05/18.
//  Copyright © 2018 IXM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        jsonFileCreation()
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
  // Fetch DB/File from Bundle and Write it into Document Directory
    func jsonFileCreation() {
        print("file")
        let filemgr = FileManager.default
        print("file path\(getFilePath())")
        let strPath = getFilePath()
        let success : Bool = filemgr.fileExists(atPath: strPath)
        if !success {
            print("new File created")
            let sourcePath = Bundle.main.path(forResource: "test", ofType: "json")
            var error : NSError?
            do {
                try filemgr.copyItem(atPath: sourcePath!, toPath: strPath)
            } catch let error1 as NSError {
                error = error1
            }
            if (error != nil) {
                print("Error Occured")
                print("\((error?.localizedDescription)!)")
            } else {
                print("Copy File Successfully")
                print("Your File JSON copy successfully on Your Device.")
            }
        } else {
            print("File already present")
        }
    }
    // Get Db/File Path From Document Directory
    func getFilePath() -> String{
        let doumentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let str = doumentDirectoryPath.object(at: 0) as! NSString;
        let destinationPath = str.appendingPathComponent("test.json")
        return destinationPath
    }

}

