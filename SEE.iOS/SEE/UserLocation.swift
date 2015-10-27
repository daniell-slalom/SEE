//
//  UserLocation.swift
//  SEE
//
//  Created by Daniel Lee on 10/26/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

class UserLocation: JSONModel {
    var username: NSString? = nil
    var regionId: NSUUID? = nil
    var major: CLBeaconMajorValue? = nil
    var minor: CLBeaconMinorValue? = nil
    var beaconName: NSString? = nil
}
