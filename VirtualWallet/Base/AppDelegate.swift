//
//  AppDelegate.swift
//  VirtualWallet
//
//  Created by solmit on 1/21/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKCoreKit
import TwitterKit
import GoogleSignIn


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
          if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
          } else {
            print("\(error.localizedDescription)")
          }
          return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            let alert = UIAlertController(title: "Alerta", message: error.localizedDescription, preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(actionOk)
            print(error.localizedDescription)
            //self?.present(alert, animated: true, completion: nil)
            return
          }
            
          let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateInitialViewController() ?? UIViewController()
          self.window = UIWindow(frame: UIScreen.main.bounds)
          self.window?.rootViewController = initialViewControlleripad
          self.window?.makeKeyAndVisible()
          
        }
        let userId = user.userID
        print(user.profile.name ?? "")
        print(userId ?? "")
        initialViewController()
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
      // Perform any operations when the user disconnects from app here.
      // ...
    }
    
    func initialViewController() {
        let onBoardingVisto = UserDefaults.standard.value(forKey: "onBoardingVisto") as? Bool ?? false
        window = UIWindow(frame: UIScreen.main.bounds)
        var name = "OnBoarding"
        if onBoardingVisto {
            name = "SignIn"
        }
        
        let session = Auth.auth().currentUser != nil
        if session {
            name = "Main"
        }
        
        let viewController = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TWTRTwitter.sharedInstance().start(withConsumerKey: "dkz2mRhplHqck8ZP5HGC6jsoT", consumerSecret: "gW4nxzNMt1OiLW4ZF9pn51m4Kr3inZpJTPNyfBvEYUMUr3nAbR")
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = "547043330870-hniu77rhcmnl7cqhnsvqh45go395hej1.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        //Facebook Configuration
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0,*)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0,*)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        //Facebook configuration
        if ApplicationDelegate.shared.application(app, open: url, options: options) {
            return true
        }
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        if GIDSignIn.sharedInstance().handle(url) {
            return true
        }
        return true
    }
        
}

