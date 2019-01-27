//
//  CreateAccountViewController.swift
//  Finstagram
//
//  Created by Krishna Chenna on 1/26/19.
//  Copyright © 2019 Krishna Chenna. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var firebaseReference: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseReference = Database.database().reference()
        
    }
    
    @IBAction func registerAccount(_ sender: Any) {
        if(fullName.text == "" || username.text == "" || password.text == ""){
            let alert = UIAlertController(title: "Please enter all values", message: "One of the following textfields is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion:nil)
        } else {
            let fullName_text = self.fullName.text ?? ""
            let username_txt = self.username.text ?? ""
            let password_txt = self.password.text ?? ""
            // firebaseReference.child("Users/").setValue(username)
            firebaseReference.child("Users/"+username_txt+"/Fullname" ).setValue(fullName_text)
            firebaseReference.child("Users/"+username_txt+"/Password").setValue(password_txt)
        }
        self.navigationController?.popViewController(animated: true)
    }
    

}
