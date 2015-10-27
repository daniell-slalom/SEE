//
//  BeaconTrackingServiceProtocal.swift
//  SEE
//
//  Created by Daniel Lee on 10/27/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//


protocol BeaconTrackingServiceProtocal: NSObjectProtocol {
    func logUserLocation(username: NSString ,  location: NSString,  timeStamp: NSDate);
    func getUserLocations()->[UserLocation];
}
