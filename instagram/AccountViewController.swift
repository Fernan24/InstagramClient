//
//  AccountViewController.swift
//  instagram
//
//  Created by Fernando Rodríguez on 3/5/16.
//  Copyright © 2016 Fernando Rodríguez. All rights reserved.
//

import UIKit
import Parse

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("logoutSgue", sender: nil)
        print("logged out")
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
