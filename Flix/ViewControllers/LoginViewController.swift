//
//  LoginViewController.swift
//  Flix
//
//  Created by William Nguyen on 11/19/18.
//  Copyright © 2018 William Nguyen. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("User successfully logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            
            if success {
                print("User was successfully created")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            } else {
                print(error?.localizedDescription)
                if error?._code == 202 {
                    print("Username is already taken")
                }
            }
        }
    }
    

}
