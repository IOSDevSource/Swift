//
//  AppDelegate.swift
//  DemoFCMPush
//
//  Created by iexm01 on 14/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var player: AVAudioPlayer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        Messaging.messaging().shouldEstablishDirectChannel = true
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert], completionHandler: {(granted, error) in
            if (granted) {
                UNUserNotificationCenter.current().delegate = self
                Messaging.messaging().delegate = self
                DispatchQueue.main.async(execute: {
                    UIApplication.shared.registerForRemoteNotifications()
                })
            } else {
                //Do stuff if unsuccessful...
            }
        })
        if UserDefaults.standard.string(forKey: "FCMToken") != nil {
            NSLog("fcm token == \(UserDefaults.standard.string(forKey: "FCMToken")!)")
        }
        // app launched via notification banner while app is not launched
        if  let userInfo = launchOptions?[UIApplicationLaunchOptionsKey.remoteNotification] as? [String: AnyObject] {
            NSLog("Current Date Notifications \(userInfo)")
            let aps = userInfo["aps"] as! NSDictionary
            NSLog("aps Notifications \(aps)")
        }
        NSLog("entered appdeleagte")
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

    // MARK: - User Notification Delegate
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        NSLog("APNs token retrieved: \(deviceToken)")
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("APNs device token: \(deviceTokenString)")
        NSLog("APNs notification device token\(deviceTokenString)")
        Messaging.messaging().apnsToken = deviceToken
        NSLog("FCM token == \(String(describing: Messaging.messaging().fcmToken))")
        NSLog("APNS Token == \(String(describing: Messaging.messaging().apnsToken))")
        if UserDefaults.standard.object(forKey: "FCM_Token") == nil {
            UserDefaults.standard.set(Messaging.messaging().fcmToken, forKey: "FCM_Token")
        } else {
            let fcmSavedToken = UserDefaults.standard.value(forKey: "FCM_Token") as! String
            if fcmSavedToken == Messaging.messaging().fcmToken {
                
            } else {
                UserDefaults.standard.set(Messaging.messaging().fcmToken, forKey: "FCM_Token")
            }
        }
        connectToFcm()
        // With swizzling disabled you must set the APNs token here.
        // Messaging.messaging().apnsToken = deviceToken
    }
    
    func connectToFcm() {
        if Messaging.messaging().isDirectChannelEstablished {
            print("Connected to FCM.")
            NSLog("Connected to FCM.")
        } else {
            print("Unable to connect with FCM.")
            NSLog("Unable to connect with FCM.")
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        NSLog("******************************************** did receive remote notification background")
        NSLog("Current Date Notifications \(userInfo)")
        var aps = userInfo["aps"] as! NSDictionary
        NSLog("aps Notifications \(aps)")
        if (application.applicationState == UIApplicationState.active) {
            NSLog("Push notification received Active forground")
            // Play sound while push recieved in foreground
            guard let url = Bundle.main.url(forResource: "apple_sms", withExtension: "mp3") else {
                print("error")
                return
            }
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                player.numberOfLoops = 0
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            NSLog("Push notification received background)")
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        NSLog("******************************************** did receive remote notification")
        NSLog("Current Date Notifications \(userInfo)")
        var aps = userInfo["aps"] as! NSDictionary
        NSLog("aps Notifications \(aps)")
        aps = aps.value(forKey: "alert") as! NSDictionary
        NSLog("body == \(aps.value(forKey: "body") as! String)")
        NSLog("title == \(aps.value(forKey: "title") as! String)")
    }
}

// MARK: - Messaging Delegate
extension AppDelegate : MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        NSLog("Firebase registration token: \(fcmToken)")
        UserDefaults.standard.set(fcmToken, forKey: "FCMToken")
        NSLog("Received Remote Message: 1\nCheck Out:\n")
    }
    
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        NSLog("******************************************** messaging did receive")
        NSLog("Received data message: \(remoteMessage.appData)")
        NSLog("Received Remote Message: 2\nCheck Out:\n")
    }
    
    // Receive data message on iOS 10 devices while app is in the foreground.
    func application(received remoteMessage: MessagingRemoteMessage) {
        NSLog("******************************************** messaging remote message")
        NSLog("Received Remote Message: 3\nCheck In:\n")
        debugPrint(remoteMessage.appData)
        NSLog("Received Remote Message: 3\nCheck Out:\n")
    }
}

