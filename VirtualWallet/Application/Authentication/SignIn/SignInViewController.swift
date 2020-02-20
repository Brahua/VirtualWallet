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
        guard let email = emailTxtField.text else {
            print("Error: emailTxtField.")
            return
        }
        guard let contrasenia = contraseniaTxtField.text else {
            print("Error: contraseniaTxtField")
            return
        }
        let valido = validarEmail(email) && validarContrasenia(contrasenia)
        
        if valido {
            Auth.auth().signIn(withEmail: email, password: contrasenia) { [weak self] (result, error) in
                if let error = error {
                    let alert = UIAlertController(title: "Alerta", message: error.localizedDescription, preferredStyle: .alert)
                    let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(actionOk)
                    self?.present(alert, animated: true, completion: nil)
                    return
                }
                
                if result != nil {
                    self?.performSegue(withIdentifier: "signInToMain", sender: self)
                }
            }
        }
    }
    
    private func validarEmail(_ email: String) -> Bool {
        if email.isEmpty {
            print("Ingrese su email.")
            return false
        }
        if !coincideCon(email, pattern: PATTERN_EMAIL) {
            print("Email inválido")
            return false
        }
        
        return true
    }
    
    private func validarContrasenia(_ contrasenia: String) -> Bool {
        if contrasenia.isEmpty {
            print("Ingrese su contraseña.")
            return false
        }
        return true
    }
    
    private func coincideCon(_ cadena: String, pattern: String) -> Bool {
        let range = NSRange(location: 0, length: cadena.count)
        var regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        } catch {
            print("validarExpresionRegular: Expresión regular inválida.")
            return false
        }
        
        let regexMatch = regex.firstMatch(in: cadena, options: [], range: range)
        return regexMatch == nil ? false : true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
