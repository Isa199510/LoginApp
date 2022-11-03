//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Иса on 03.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // User name and Password
    let userName = "User"
    let password = "Password"

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // MARK: - Navigation
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let username = userNameTextField.text,
              let password = passwordTextField.text else { return }
        
        if username == self.userName && password == self.password {
            
            guard let userNameVC = segue.destination as? UserNameViewController else { return }
            userNameVC.welcome = "Welcome, \(userNameTextField.text ?? "")"
            
        } else {
            
            showAlert(
                title: "Неправильный Логин или Пароль",
                message: "Пожалуйста, введите логин и пароль",
                handler: {_ in self.passwordTextField.text = ""}
            )
        }
        
    }

    
    // MARK: - IBAction
    
    @IBAction func unwindToLogIn(_ unwindSegue: UIStoryboardSegue) {
        
        let usernameVC = unwindSegue.source as? UserNameViewController
        usernameVC?.dismiss(animated: true)
        
        userNameTextField.text = ""
        passwordTextField.text = ""

        userNameTextField.endEditing(true)      // завершение редактирования текстового поля
        passwordTextField.endEditing(true)

    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Упс!", message: "Ваш логин \(userName)", handler: nil)
    }
    
    @IBAction func forgotPassworPressed() {
        showAlert(title: "Упс!", message: "Ваш пароль \(password)", handler: nil)
    }
    
    
    //MARK: - Private functions
    
    private func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        self.present(alert, animated: true)
    }
    
}
