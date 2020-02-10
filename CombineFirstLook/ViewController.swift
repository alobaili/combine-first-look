//
//  ViewController.swift
//  CombineFirstLook
//
//  Created by Abdulaziz AlObaili on 10/02/2020.
//  Copyright © 2020 Abdulaziz AlObaili. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var notARobotSwitch: UISwitch!
    @IBOutlet weak var loginButton: UIButton!
    
    @Published var didFillUsername = false
    @Published var didFillPassword = false
    @Published var notARobot = false
    var subscriber: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        subscriber = Publishers.CombineLatest3($didFillUsername, $didFillPassword, $notARobot)
            .receive(on: DispatchQueue.main)
            .map { $0 && $1 && $2 }
            .assign(to: \.isEnabled, on: loginButton)
    }

    @IBAction func textChanged(_ sender: UITextField) {
        if sender.placeholder! == "Username" {
            didFillUsername = sender.text!.count > 3
        } else {
            didFillPassword = sender.text!.count > 3
        }
    }
    
    @IBAction func notARobotTapped(_ sender: UISwitch) {
        notARobot = sender.isOn
    }
    
    
}
