//
//  SignInViewController.swift
//  VirtualWallet
//
//  Created by MacSpace on 2/20/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    let PATTERN_EMAIL: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var contraseniaTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func iniciarSesion(_ sender: Any) {
        SignInViewModel.iniciarSesionCon(email: emailTxtField.text, contrasenia: contraseniaTxtField.text) { [weak self] (success, error) in
            if let error = error {
                let alert = UIAlertController(title: "Alerta", message: error.localizedDescription, preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(actionOk)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            
            if success {
                self?.performSegue(withIdentifier: "signInToMain", sender: self)
            }
        }
    }
    
    
    @IBAction func iniciarSesionFacebook(_ sender: Any) {
        SignInViewModel.iniciarSesionConFacebook(viewController: self) { [weak self] (success, error) in
            if let error = error {
                let alert = UIAlertController(title: "Alerta", message: error.localizedDescription, preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(actionOk)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            
            if success {
                self?.performSegue(withIdentifier: "signInToMain", sender: self)
            }
        }
    }
    
}
