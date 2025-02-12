//
//  WelcomeViewController.swift
//  HelloWorld6
//
//  Created by Evgeniy Morozov on 08.02.2025.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var greetingsLabel: UILabel!
    
    // MARK: - Public Properties
    var greetingsValue: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let greetingsValue {
            greetingsLabel.text = "Welcome, \(greetingsValue)!"
        }
        
        setColor()
    }
    
    // MARK: - IB Actions
    @IBAction private func logOutAction() {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    func setColor() {
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
}
