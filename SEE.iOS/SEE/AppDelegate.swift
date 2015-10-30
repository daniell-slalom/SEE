//
//  AppDelegate.swift
//  SEE
//
//  Created by Daniel Lee on 10/25/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate {

    var window: UIWindow?
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "b9407f30-f5f8-466e-aff9-25556b57fe6d")!, identifier: "region")

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 3. Set the beacon manager's delegate
        self.beaconManager.delegate = self
        // 4. We need to request this authorization for every beacon manager
        self.beaconManager.requestAlwaysAuthorization()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func beaconManager(manager: AnyObject, didStartMonitoringForRegion region: CLBeaconRegion) {
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        NSNotificationCenter.defaultCenter().postNotificationName(kDidRangeBeacon, object: beacons)
        
        SessionManager.instance.foundBeacon = beacons.count > 0
        if(beacons.count > 0){
            debugPrint("Found beacons:")
            for beacon in beacons{
                let myMinor = beacon.minor
                let myMajor = beacon.major
                let formatedString = String(myMajor) + ":" + String(myMinor)
                
                var locationString = "Unknown location"
                if(formatedString == "43384:51080"){
                    locationString = "Stop Freakin! Call Beacon!"
                }else if(formatedString == "45777:8263"){
                    locationString = "Kevin Beacon's Beacon"
                }
                

                if let username = SessionManager.instance.username {
                 
                    let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
                    
                    SessionManager.instance.service.logUserLocation(username, location: locationString, timeStamp: timestamp)
                }
                
                
                debugPrint(formatedString)
            }
        }else{
            debugPrint("Searching...")
        }
    }
    
    func beaconManager(manager: AnyObject, monitoringDidFailForRegion region: CLBeaconRegion?, withError error: NSError) {
        
    }
    
}

