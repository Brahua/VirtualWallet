//
//  BudgetViewController.swift
//  VirtualWallet
//
//  Created by apple on 1/23/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit

class PresupuestoViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var animationsButtons: [UIButton]!
    
    @IBOutlet var animationLayout: NSLayoutConstraint!
    
    @IBAction func animateHeader(sender: UIButton){
        animationLayout.constant = sender.frame.origin.x
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }) { (completed) in
            self.animationsButtons.forEach { (UIButton) in
                UIButton.setTitleColor(UIColor.black, for: .normal)
                //sender.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib(nibName: "TransaccionCelda", bundle: Bundle.main)

        tableView.register(cell, forCellReuseIdentifier: "TransaccionCelda")
    }

}

extension PresupuestoViewController: UITableViewDelegate {
    
}

extension PresupuestoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "TransaccionCelda", for: indexPath)
    }
}
