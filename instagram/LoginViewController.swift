//
//  LoginViewController.swift
//  instagram
//
//  Created by Fernando Rodríguez on 3/4/16.
//  Copyright © 2016 Fernando Rodríguez. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user:PFUser?, error:NSError?) -> Void in
            if user != nil {
                print("succesfuly logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.email = emailField.text
        newUser.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if success {
                print("successfully added user")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }else {
                print(error?.localizedDescription)
                print(error?.code)
                if error?.code == 202 {
                    print("account already created")
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
