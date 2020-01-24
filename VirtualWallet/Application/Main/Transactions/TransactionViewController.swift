//
//  TransactionViewController.swift
//  VirtualWallet
//
//  Created by solmit on 1/23/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView else {
            return UIView()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib(nibName: "TransactionCell", bundle: Bundle.main)

        tableView.register(cell, forCellReuseIdentifier: "cellTransaction")
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

extension TransactionViewController: UITableViewDelegate {
    
}

extension TransactionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 0
        tableView.backgroundView = count == 0 ? emptyStateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "cellTransaction", for: indexPath)
    }
}
