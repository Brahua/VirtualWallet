//
//  OnBoardingContainerViewController.swift
//  VirtualWallet
//
//  Created by solmit on 1/21/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController  else {
            return
        }
        
        destination.pageControl = pageControl
    }
    

}
