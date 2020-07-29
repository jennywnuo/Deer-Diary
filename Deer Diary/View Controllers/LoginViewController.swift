//
//  LoginViewController.swift
//  Deer Diary
//
//  Created by Clara Hung on 7/29/20.
//  Copyright © 2020 jenny and clara. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if usernameText.text == "Jenny" && passwordText.text == "fakepw" {
            print("successful login") //for testing purposes
        }
        else {
            print("username or password incorrect, please try again")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
