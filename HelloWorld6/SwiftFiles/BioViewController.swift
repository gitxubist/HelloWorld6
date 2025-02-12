//
//  BioViewController.swift
//  HelloWorld6
//
//  Created by Evgeniy Morozov on 12.02.2025.
//

import UIKit

final class BioViewController: UIViewController {
    
    
    @IBOutlet weak var userTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColor()
        setAboutOfUser()
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
        
        userTextView.borderStyle = .none
        userTextView.backgroundColor = .clear
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setAboutOfUser() {
        let person = Person.person.first!
        
        title = "\(person.name) \(person.familyName) Bio"
        
        userTextView.text = person.lifeHistory
    
    }
}
