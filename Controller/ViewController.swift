//
//  ViewController.swift
//  LogginScreen
//
//  Created by Николай Петров on 21.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var userNmaeTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - private properties

    private var wrongLogData: [String?:String?] = [:]

    // MARK: - IB Action

    @IBAction func forgotUsername() {
        showAlert(title: "Oops!",
                  message: "Your name is 'User'",
                  clearText: false)
    }
    @IBAction func forgotPassword() {
        showAlert(title: "Oops!",
                  message: "Your password is 'Password'",
                  clearText: false)
    }
    
    
    @IBAction func pressedLoginButton() {
        if userNmaeTextField.text == "User",
            passwordTextField.text == "Password" {
            successfulLogin()
        } else {
            wrongLogData[userNmaeTextField.text] = passwordTextField.text
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      clearText: true)
        }
        
        func viewDidLoad() {
            
        }
    }
    
    
    
    private func successfulLogin() {
        performSegue(withIdentifier: "successfulLogin", sender: nil)
    }
    
}


extension ViewController {
    private func showAlert(title: String,
                           message: String,
                           clearText: Bool) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if clearText {
                self.userNmaeTextField.text = ""
                self.passwordTextField.text = ""
            }
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
        
    }
}
