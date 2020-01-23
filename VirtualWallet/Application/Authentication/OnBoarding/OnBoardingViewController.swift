//
//  OnBoardingViewController.swift
//  VirtualWallet
//
//  Created by solmit on 1/21/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit

struct OnBoardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIViewController {
    var pageControl: UIPageControl?
    fileprivate(set) lazy var items: [OnBoardingItem] = {
        return [
            OnBoardingItem(title: "Save money and reduce debit", description: "Press the start button", imageName: "OnBoarding1"),
            OnBoardingItem(title: "You've finished your onboarding", description: "Press the start button", imageName: "OnBoarding2")
        ]
    }()
    
    fileprivate(set) lazy var contentViewControllers: [UIViewController]{
        var items = [UIViewController]()
        for i in 0..<self.items.count {
            <#code#>
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
