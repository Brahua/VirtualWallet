//
//  Presupuesto.swift
//  VirtualWallet
//
//  Created by solmit on 6/24/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation

public class Presupuesto {
    var categoria: CategoriaPresupuesto
    var valor: Float
    
    public init(categoria: CategoriaPresupuesto, valor: Float){
        self.categoria = categoria
        self.valor = valor
    }
}
