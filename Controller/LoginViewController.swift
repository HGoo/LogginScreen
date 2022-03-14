//
//  ViewController.swift
//  LogginScreen
//
//  Created by Николай Петров on 21.02.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNmaeTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let userName = "Nik"
    private let password = "1"
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "successfulLogin" else { return }
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNmaeTextField.text
    }
    
    // MARK: - IB Action
    @IBAction func pressedLoginButton() {
        if userNmaeTextField.text == userName,
           passwordTextField.text == password {
            performSegue(withIdentifier: "successfulLogin", sender: nil)
        } else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
            textField: passwordTextField)
        }
    }
    
    @IBAction func forgotUsername() {
        showAlert(title: "Oops!",
                  message: "Your name is '\(userName)'")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oops!",
                  message: "Your password is '\(password)'",
                  textField: passwordTextField)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNmaeTextField.text = nil
        passwordTextField.text = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNmaeTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - Setup show alert
extension LoginViewController {
    private func showAlert(title: String,
                           message: String,
                           textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = nil
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Text field delegate
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
        
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNmaeTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            pressedLoginButton()
        }

        return true
    }
}
