//
//  MockService.swift
//  SEE
//
//  Created by Daniel Lee on 10/27/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

class MockService: NSObject, BeaconTrackingServiceProtocal {
    var userlocations: [String: UserLocation] = [:]
    func logUserLocation(username: String,  location: String,  timeStamp: String){
        let userlocation = UserLocation()
        userlocation.username = username
        userlocation.location = location
        userlocation.timeStamp = timeStamp
        
        userlocations[username] = userlocation
    }
    
    func getUserLocations()->[UserLocation]{
        var items = [UserLocation]()
        for (_,v) in self.userlocations{
            items.append(v)
        }
        return items
    }
}
