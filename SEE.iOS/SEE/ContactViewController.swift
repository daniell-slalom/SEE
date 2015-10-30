//
//  ContactViewController.swift
//  SEE
//
//  Created by Daniel Lee on 10/27/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class ContactViewController: BaseViewController,UITextFieldDelegate{

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var GreetingLabelView: UILabel!
    @IBOutlet weak var trackingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()



        let tap = UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard"))
        self.view.addGestureRecognizer(tap)
        
        self.usernameTextField.delegate = self;
        self.trackingSwitch.setOn(false, animated: false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func dismissKeyboard(){
        usernameTextField.resignFirstResponder()
    }
    
    @IBAction func usernameTextFieldTextDidChange(sender: AnyObject) {
        SessionManager.instance.username = usernameTextField!.text
        
        self.GreetingLabelView!.text = "Hello " + SessionManager.instance.username! + "!"
        
        self.trackingSwitch.setOn(false, animated: true)
    }
    
    @IBAction func trackSwitchChanged(sender: AnyObject) {
        
        if(trackingSwitch.on && self.usernameTextField.text == ""){
            trackingSwitch.setOn(false, animated: true)
        }
        
        SessionManager.instance.shouldTrack = self.trackingSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        dismissKeyboard()
        return false;
    }
}
