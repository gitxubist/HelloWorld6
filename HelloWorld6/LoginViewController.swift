//
//  ViewController.swift
//  HelloWorld6
//
//  Created by Evgeniy Morozov on 07.02.2025.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var userNameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    
    // MARK: - Private Properties
    private let login = "1"
    private let password = "1"
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    // MARK: - Overrides Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? WelcomeViewController
        settingsVC?.greetingsValue = userNameField.text
        unwind()
    }

    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameField.text == login, passwordField.text == password else {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
            return false
        }
        
        // Введенное имя валидно, разрешаем переход
        return true
    }

    // MARK: - IB Actions
    @IBAction func forgotAction(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(withTitle: "Oops",
                      andMessage: "Your name is \(login) 😄")
        }
            
        if sender.tag == 1 {
            showAlert(withTitle: "Oops",
                      andMessage: "Your password is \(password) 😊")
        }
    }
    
    // MARK: - Private Methods
    private func unwind() {
        userNameField.text = ""
        passwordField.text = ""
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
