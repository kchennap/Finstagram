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
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 4
        let ref = Database.database().reference()
        ref.child("Users/name").setValue("Beyonce")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Forgot Password", message: "Please enter your email", preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = "example@icloud.com"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: { (action:UIAlertAction) in
            if let textField = alert.textFields?.first
            {
                if textField.text == "" {
                    print("Please enter a valid email")
                }
            }
            
            
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "name") as! NameViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createAccount") as! CreateAccountViewController

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

