//
//  ViewController.swift
//  HelloWorld6
//
//  Created by Evgeniy Morozov on 07.02.2025.
//

import UIKit

final class MainViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var userNameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    
    // MARK: - Private Properties
    private let smileyFace: String = "😄"
    private let smileyFaceEmoji: String = "😊"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.delegate = self
        passwordField.delegate = self
    }
    
    // MARK: - Overrides Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? WelcomeViewController
        settingsVC?.greetingsValue = userNameField.text
        userNameField.text = settingsVC?.userNameValue
        passwordField.text = settingsVC?.passwordValue
    }

    // MARK: - IB Actions
    @IBAction private func forgotActionUN() {
        showAlert(withTitle: "Oops", andMessage: "Your name is 1 \(smileyFace)")
    }
    
    @IBAction private func forgotActionP() {
        showAlert(withTitle: "Oops", andMessage: "Your password is 1 \(smileyFaceEmoji)")
    }
    
    @IBAction func loginAction() {
        guard let inputText = userNameField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Login field is empty", andMessage: "Please enter your User name")
            return
        }
        
        let usernamePattern = "^[a-zA-Z0-9_]{1,20}$"
        let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern)
            .evaluate(with: inputText)
        
        if !isUsernameValid {
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
            return
        }
        
        guard userNameField.text == "1", passwordField.text == "1" else {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
            return
        }
    }
    
    // MARK: - Public Methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // Проверяем, какое именно текстовое поле редактируется
        if textField == userNameField {
            print("Редактируем первое текстовое поле 1")
        } else if textField == passwordField {
            print("Редактируем второе текстовое поле 2")
        }
        
        // Показать клавиатуру автоматически
        textField.becomeFirstResponder()
        return true
    }
}

// MARK: - Alert Controller
extension MainViewController {
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


