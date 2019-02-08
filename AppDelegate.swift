//
//  AppDelegate.swift
//  CurbGenie
//
//  Created by Colin Horsford on 11/25/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?, databasePath = NSString()
    let filemgr = FileManager.default;
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //intitalizing Firebase
        FirebaseApp.configure()
        
        //show status bar after launch. Hidden on launch screen via info.plist
        UIApplication.shared.isStatusBarHidden = false
        
        //makes status bar light since there is a dark background
        UIApplication.shared.statusBarStyle = .lightContent
        
        //creating storyboard manually
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
         
        HomeModel.getInstance().createTables()
        
        let dirPaths = self.filemgr.urls(for: .documentDirectory, in: .userDomainMask);
        self.databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
        let contactDB = FMDatabase(path: self.databasePath as String);
        contactDB!.open()
        let results1: FMResultSet? = contactDB!.executeQuery("SELECT * FROM User", withArgumentsIn: nil)
        var activity_table_count = Int(); while results1!.next()
        {
            activity_table_count += 1
            //_ = results1!.string(forColumn: "Id");
            
            let tid = results1?.string(forColumnIndex: 0)
            
            print(" results1?.string(forColumnIndex: 0) \(String(describing: tid))")
            
            HomeModel.getInstance().userId = tid ?? ""
            //HomeModel.getInstance().userName = results1!.string(forColumn: "Full_Name");
        }
        
        if activity_table_count > 0
        {
            //window?.rootViewController = UINavigationController(rootViewController: BookingsController())
            
            let layout = UICollectionViewFlowLayout()
            let bookingsController = BookingsController(collectionViewLayout: layout)
            window?.rootViewController = UINavigationController(rootViewController: bookingsController)
        }
        else
        {
            window?.rootViewController = UINavigationController(rootViewController: LoginController())
            //window?.rootViewController = UINavigationController(rootViewController: RegisterController())
        }
        contactDB!.close()
        
        
        //makes the BookingsController the root view because the user should see all of their bookings upon logging in. If not, they can create a booking.
        //window?.rootViewController = UINavigationController(rootViewController: BookingsController())
        
        //window?.rootViewController = UINavigationController(rootViewController: LoginController())
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


}

