//
//  UserViewController.swift
//  HelloWorld6
//
//  Created by Evgeniy Morozov on 12.02.2025.
//

import UIKit

final class UserViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameTestField: UITextField!
    @IBOutlet weak var familyNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var jobTitleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUserInfo()
        setColor()
    }
    
    // MARK: - Private Methods
    private func setColor() {
        let gradientLayer = CAGradientLayer()
        
        let colorUP = UIColor(red: 255/255,
                              green: 192/255,
                              blue: 203/255,
                              alpha: 1.0).cgColor
        let colorDOWN = UIColor(red: 135/255,
                                green: 206/255,
                                blue: 250/255,
                                alpha: 1.0).cgColor
                                
        gradientLayer.colors = [
            colorUP,
            colorDOWN
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setUserInfo() {
        let person = Person.person.first!
        
        nameTestField.text = "Имя: \(person.name)"
        familyNameTextField.text = "Фамилия: \(person.familyName)"
        companyTextField.text = "Компания: \(person.company)"
        departmentTextField.text = "Отдел: \(person.department)"
        jobTitleTextField.text = "Должность: \(person.jobTitle)"
        
        if let imageName = person.image {
            userImageView.image = UIImage(named: imageName)
        }
    }
    
}
