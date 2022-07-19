//
//  LoginViewController.swift


import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    @IBAction func loginPressed(_ sender: UIButton) {
    
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                   
                if let e = error {
                  
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self?.present(alert, animated: true, completion: nil)
                } else {
                    //if no errors, go to chat
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
                
            }
        }
    }
}
