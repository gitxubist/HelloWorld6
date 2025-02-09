//
//  ViewController.swift
//  HelloWorld6
//
//  Created by Evgeniy Morozov on 07.02.2025.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var userNameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    
    // MARK: - Private Properties
    private let smileyFace: String = "😄"
    private let smileyFaceEmoji: String = "😊"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IB Actions
    @IBAction private func forgotActionUN() {
        showAlert(withTitle: "Oops", andMessage: "Your name is 1 \(smileyFace)")
    }
    @IBAction private func forgotActionP() {
        showAlert(withTitle: "Oops", andMessage: "Your password is 1 \(smileyFaceEmoji)")
    }
}

// MARK: - Alert Controller
extension MainViewController {
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

