//
//  AzureService.swift
//  SEE
//
//  Created by Daniel Lee on 10/28/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import Foundation

class AzureService: NSObject, BeaconTrackingServiceProtocal{
    let client:MSClient! = MSClient(
        applicationURLString:"https://see.azure-mobile.net/",
        applicationKey:"UpoYNHtRLKOekZZWZbucnBfpncsoRb77"
    )
    var userlocations: [UserLocation]! = []

    
    func logUserLocation(username: String ,  location: String,  timeStamp: String){
        let userlocation = UserLocation()
        userlocation.username = username
        userlocation.location = location
        userlocation.timeStamp = timeStamp
        let json = userlocation.toDictionary()
        postUserlocation(json)
    }
    
//    func logUserLocation(username: String ,  location: String,  timeStamp: String);
//    func getUserLocations()->[UserLocation];
    
    func getUserLocations()->[UserLocation]{
        self.getUserlocations { (result, response, error) -> Void in
            if(error == nil){
                let results = result as! NSArray
                var myUserlocations = [UserLocation]()
                for r in results{
                    let dict = r as! NSDictionary
                    let timeStamp = dict["timeStamp"] as! String
                    let username = dict["username"] as! String
                    let location = dict["location"] as! String
                    
                    let userlocation = UserLocation()
                    userlocation.username = username
                    userlocation.location = location
                    userlocation.timeStamp = timeStamp
                    
                    myUserlocations.append(userlocation)
                }
                self.userlocations = myUserlocations
            }
        }
        return self.userlocations
    }
    
    
    func getUserlocations(callBack: (AnyObject!, NSHTTPURLResponse!, NSError!) -> Void){
        self.client.invokeAPI("beacon", body: nil, HTTPMethod: "GET", parameters: nil, headers: nil, completion: callBack)
    }
    
    func postUserlocation(userloaction: NSDictionary){
        self.client.invokeAPI("beacon", body: userloaction, HTTPMethod: "POST", parameters: nil, headers: nil, completion: nil)
    }
}
