//
//  AgregarViewController.swift
//  VirtualWallet
//
//  Created by solmit on 6/24/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import UIKit

class AgregarViewController: UIViewController {

    @IBOutlet var nombreTextField: UITextField!
    @IBOutlet var descripcionTextField: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var monedaLabel: UILabel!
    @IBOutlet var valorTextField: UITextField!
    
    private var viewModel = AgregarTransaccionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // valorTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func agregar(_ sender: UIButton) {
        self.viewModel.agregar(
            nombre: self.nombreTextField.text ?? "",
            descripcion: self.descripcionTextField.text ?? "",
            valor: self.valorTextField.text ?? ""
        )
        
        self.valorTextField.resignFirstResponder()
        tabBarController?.selectedIndex = 0
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
