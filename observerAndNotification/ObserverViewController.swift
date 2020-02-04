//
//  ObserverViewController.swift
//  observerAndNotification
//
//  Created by Md Maruf Prodhan on 2/4/20.
//  Copyright © 2020 Md Maruf Prodhan. All rights reserved.
//

import UIKit


class ObserverViewController: UIViewController {
    
     var message: String = ""
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        
        //notification
        message = textField.text!
        let name = Notification.Name(rawValue: ObserverViewControllerNotificationKey)
        NotificationCenter.default.post(name: name, object: self, userInfo: [name: self.message])
        dismiss(animated: true, completion: nil)
    }
    
}
