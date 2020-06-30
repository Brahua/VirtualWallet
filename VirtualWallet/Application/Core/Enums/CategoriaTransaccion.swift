//
//  CategoriaTransaccion.swift
//  VirtualWallet
//
//  Created by solmit on 6/24/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation

public enum CategoriaTransaccion: Int {
    case ingreso, gasto
}

extension CategoriaTransaccion: Codable {
    
}
