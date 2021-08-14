//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Tanaka Muchemwa on 8/6/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var signinButton: UIButton!
    
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signinButton.layer.cornerRadius = 15.0
        signinButton.clipsToBounds = true
        signinButton.layer.shadowRadius = 15.0
        signinButton.layer.shadowOpacity = 0.2
        
        signupButton.layer.cornerRadius = 15.0
        signupButton.clipsToBounds = true
        signupButton.layer.shadowRadius = 15.0
        signupButton.layer.shadowOpacity = 0.2
    }
    
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {( user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "\(error?.localizedDescription ?? "Something went wrong and we could not sign you in")", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)            }
        }
        
    }

    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (sucess, error) in
            if sucess {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "\(error?.localizedDescription ?? "Something went wrong and we could not sign you up")", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
            }
        }
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
