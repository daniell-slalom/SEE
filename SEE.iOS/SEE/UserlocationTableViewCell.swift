//
//  UserlocationTableViewCell.swift
//  SEE
//
//  Created by Daniel Lee on 10/27/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class UserlocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!

    func updateLabels(userlocation: UserLocation){
        self.timeStampLabel.text = userlocation.timeStamp
        self.locationLabel.text = userlocation.location
        self.usernameLabel.text = userlocation.username
    }
}
