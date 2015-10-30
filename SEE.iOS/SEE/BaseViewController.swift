//
//  BaseViewController.swift
//  SEE
//
//  Created by Daniel Lee on 10/29/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController{
    
    var shouldAnimate: Bool = true
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.shouldAnimate = true
        triggerAnimation(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.shouldAnimate = false
    }
    
    func triggerAnimation(toWhite: Bool){

        var color = UIColor.whiteColor()
        if(!toWhite){
            if(SessionManager.instance.foundBeacon){
                color = UIColor(red: 68/256, green: 179/256, blue: 194/256, alpha: 1)
            }else{
                color = UIColor(red: 241/256, green: 169/256, blue: 78/256, alpha: 1)
            }
        }

        UIView.animateWithDuration(2, delay: 0, options: .AllowUserInteraction, animations: {
            self.view.backgroundColor = color
            }, completion: {
                (value: Bool) in
                if(self.shouldAnimate){
                    self.triggerAnimation(!toWhite)
                }
                
        })
    }
}
