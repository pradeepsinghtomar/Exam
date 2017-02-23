//
//  UserInfoViewController.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit


let userDummyDataArray : [Dictionary <String,String>] = [
                            ["name":"Pradeep","number":"9878666"],
                            ["name": "Ravi","number":"9834666"],
                            ["name": "Jason","number":"9879666"],
                            ["name": "Jaya","number":"87478445"]
                        ]


class UserInfoViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func doneAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let counter = arc4random_uniform(UInt32(userDummyDataArray.count))
        let userRecord = userDummyDataArray[Int(counter)]
        
        if let name = userRecord["name"] {
            userNameLabel.text = name
        }
        else{
            userNameLabel.text = "No name"
        }
        
        if let number = userRecord["number"] {
            numberLabel.text = number
        }
        else{
            numberLabel.text = "No number"
        }
    }
}
