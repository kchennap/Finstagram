//
//  ViewController.swift
//  Finstagram
//
//  Created by Krishna Chenna on 1/24/19.
//  Copyright © 2019 Krishna Chenna. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        ref.child("Users/name").setValue("Johnathan")
        // Do any additional setup after loading the view, typically from a nib.
    }

}

