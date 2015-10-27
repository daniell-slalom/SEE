//
//  MockService.swift
//  SEE
//
//  Created by Daniel Lee on 10/27/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

class MockService: NSObject, BeaconTrackingServiceProtocal {
    func logUserLocation(username: NSString,  location: NSString,  timeStamp: NSDate){
        
    }
    
    func getUserLocations()->[UserLocation]{
        return []
    }
}
