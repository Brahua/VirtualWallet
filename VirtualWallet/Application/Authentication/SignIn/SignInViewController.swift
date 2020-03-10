//
//  SignInViewController.swift
//  VirtualWallet
//
//  Created by MacSpace on 2/20/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class SignInViewController: UIViewController {
    

    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var contraseniaTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        // ...
        
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
    
    
    @IBAction func iniciarSesionConGoogle(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func iniciarSesionConTwitter(_ sender: UIButton) {
        SignInViewModel.iniciarSesionConTwitter(viewController: self) { [weak self] (success, error) in
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
