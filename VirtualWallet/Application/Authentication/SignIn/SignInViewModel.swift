//
//  SignInViewModel.swift
//  VirtualWallet
//
//  Created by MacSpace on 2/20/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit

class SignInViewModel {
    
    typealias SignInHandler = ( (_ success: Bool, _ error: Error?) -> Void )
    
    static func iniciarSesionCon(email: String?, contrasenia: String?, handler: SignInHandler?){
        
        guard let email = email, validarEmail(email) else {
            print("Correo inválido.")
            return
        }
        guard let contrasenia = contrasenia, validarContrasenia(contrasenia) else {
            print("Contraseña inválida.")
            return
        }
        guard let handler = handler else {
            print("Handler inválido.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: contrasenia) { (result, error) in
            if let error = error {
                handler(false, error)
            }
            if result != nil {
                handler(true, nil)
            }
        }
        
    }
    
    static func iniciarSesionConFacebook(viewController: UIViewController, handler: SignInHandler?){
        LoginManager().logIn(permissions: ["email"], from: viewController) { (result, error) in
            if let error = error {
                handler?(false, error)
                return
            }
            
            guard let token = AccessToken.current?.tokenString else {
                return
            }
            let credentials = FacebookAuthProvider.credential(withAccessToken: token)
            Auth.auth().signIn(with: credentials) { (result, error) in
                if let error = error {
                    handler?(false, error)
                    return
                }
                //let userInformation = result?.additionalUserInfo?.profile
                handler?(true, nil)
            }
        }
    }
    
    static func validarEmail(_ email: String) -> Bool {
        if email.isEmpty {
            print("Ingrese su email.")
            return false
        }
        if !Util.validarRegex(email, pattern: Pattern.PATTERN_EMAIL) {
            print("Email inválido")
            return false
        }
        
        return true
    }
    
    static func validarContrasenia(_ contrasenia: String) -> Bool {
        if contrasenia.isEmpty {
            print("Ingrese su contraseña.")
            return false
        }
        return true
    }
    
}
