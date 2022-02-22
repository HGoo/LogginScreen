//
//  ResultViewController.swift
//  LogginScreen
//
//  Created by Николай Петров on 21.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var welcomUserLable: UILabel!
    
    // MARK: - Public properties
    var userName: String?
    
    // MARK: - Private properties
    private  let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 128/255, alpha: 1)
    private  let secondaryColor = UIColor(red: 107/255, green: 148/255, blue: 130/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupViewLable()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    // MARK: - IB Action
 
    
    // MARK: - Private method
    private func setupViewLable() {
        welcomUserLable.text = "Welcome, \(userName ?? "Noname")!"
    }
    
    
    deinit {
        print("WelcomVC")
    }
}

// MARK: - Set background color
extension WelcomeViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations  = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
