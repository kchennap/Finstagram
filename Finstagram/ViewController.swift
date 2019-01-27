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
    
    var firebaseReference: DatabaseReference!
    
    @IBOutlet weak var errorLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 4
        firebaseReference = Database.database().reference()
        
        
        
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
        let users_username = username.text ?? ""
        let users_pswd = password.text ?? ""
        firebaseReference.child("Users").child(users_username).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            if((value) != nil){
                let password = value?["Password"] as? String ?? ""
                let full_name = value?["Fullname"] as? String ?? ""
                if(users_pswd == password){
                    self.errorLbl.text = "Succesful Login"
                    self.errorLbl.textColor = UIColor.green
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "name") as! NameViewController
                    vc.name = full_name
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self.errorLbl.text = "Please enter valid Password"
                    self.errorLbl.textColor = UIColor.red
                }
            } else {
                self.errorLbl.text = "Please enter valid Username"
                self.errorLbl.textColor = UIColor.red
            }
                // ...
        }) { (error) in
                print(error.localizedDescription)
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createAccount") as! CreateAccountViewController

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

