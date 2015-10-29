//
//  SessionManager.swift
//  SEE
//
//  Created by Daniel Lee on 10/27/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//


class SessionManager: NSObject {
    static let instance: SessionManager = SessionManager()
    var username: String? = nil
    var service: BeaconTrackingServiceProtocal = AzureService()
}
