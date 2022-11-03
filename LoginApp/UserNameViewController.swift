//
//  UserNameViewController.swift
//  LoginApp
//
//  Created by Иса on 03.11.2022.
//

import UIKit

class UserNameViewController: UIViewController {

    var welcome = ""
    
    @IBOutlet var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = welcome
        
    }

}
