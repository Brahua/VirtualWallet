//
//  SceneDelegate.swift
//  VirtualWallet
//
//  Created by solmit on 1/21/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        let onBoardingVisto = UserDefaults.standard.value(forKey: "onBoardingVisto") as? Bool ?? false
        var name = "OnBoarding"
        if onBoardingVisto {
            name = "SignIn"
        }
        let viewController = UIStoryboard(name: name, bundle:nil).instantiateInitialViewController()
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let openUrlContext = URLContexts.first else {
            return
        }
        ApplicationDelegate.shared.application(UIApplication.shared, open: openUrlContext.url, sourceApplication: openUrlContext.options.sourceApplication, annotation:openUrlContext.options.annotation)
        
    }
    // SceneDelegate.m #import <FBSDKCoreKit/FBSDKCoreKit.h> - (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts { UIOpenURLContext *openURLContext = URLContexts.allObjects.firstObject; if (openURLContext) { [[FBSDKApplicationDelegate sharedInstance] application:UIApplication.sharedApplication openURL:openURLContext.URL sourceApplication:openURLContext.options.sourceApplication annotation:openURLContext.options.annotation]; } // Add any custom logic here. }
        


}

