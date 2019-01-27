//
//  NameViewController.swift
//  Finstagram
//
//  Created by Krishna Chenna on 1/26/19.
//  Copyright © 2019 Krishna Chenna. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    var name:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = "Hello " + name + "!"
        // Do any additional setup after loading the view.
    }

}
