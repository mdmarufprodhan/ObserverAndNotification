//
//  ViewController.swift
//  observerAndNotification
//
//  Created by Md Maruf Prodhan on 2/4/20.
//  Copyright © 2020 Md Maruf Prodhan. All rights reserved.
//

import UIKit

let ObserverViewControllerNotificationKey = "com.maruf.observer"

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    var message:String = ""
    let name = Notification.Name(rawValue: ObserverViewControllerNotificationKey)
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
        
        // segue
        let ObserverViewController = storyboard?.instantiateViewController(withIdentifier: "ObserverViewController") as! ObserverViewController
        present(ObserverViewController, animated: true, completion: nil)
    }
    func CreateObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateMessage(notification:)), name: name, object: nil)
    }
    @objc func updateMessage(notification: NSNotification) {
        //        let notificationName = notification.name == name
        //        let temp = notificationName ? message  = "notification received !" : message = "error"
        if notification.name == name {
            let userInfo = notification.userInfo!
            let something = userInfo[name]! as! String
            self.messageLabel.text = something
        }
    }

}

