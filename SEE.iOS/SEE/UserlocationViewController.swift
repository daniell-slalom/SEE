//
//  UserlocationViewController.swift
//  SEE
//
//  Created by Daniel Lee on 10/27/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class UserlocationViewController: BaseViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var userlocationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userlocationTableView.dataSource = self
        self.userlocationTableView.delegate = self;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("reloadTable"), name: kDidRangeBeacon, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func reloadTable(){
        
        let range = NSMakeRange(0, self.userlocationTableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        self.userlocationTableView.reloadSections(sections, withRowAnimation: .Automatic)
//        self.userlocationTableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let userlocations = SessionManager.instance.service.getUserLocations()
        return userlocations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = self.userlocationTableView.dequeueReusableCellWithIdentifier(kUserlocationTableViewCellReuseId) as?UserlocationTableViewCell
        if(cell == nil){
            cell = UserlocationTableViewCell()
        }
        
        let item = SessionManager.instance.service.getUserLocations()[indexPath.row]
        cell!.updateLabels(item)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 60;
    }
}
