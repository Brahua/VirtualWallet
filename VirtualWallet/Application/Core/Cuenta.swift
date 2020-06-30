//
//  Cuenta.swift
//  VirtualWallet
//
//  Created by solmit on 6/24/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation

public class Cuenta {
    var descripcion: String
    var valor: Float
    var transacciones: [Transaccion]
    
    public init(descripcion: String, valor: Float, transacciones: [Transaccion]) {
        self.descripcion = descripcion
        self.valor = valor
        self.transacciones = transacciones
    }
    
    public func agregar(transaccion: Transaccion) {
        transacciones.append(transaccion)
        
        switch transaccion.categoria {
        case .gasto:
            self.valor -= transaccion.valor
        case .ingreso:
            self.valor += transaccion.valor
        }
    }
    
    public func eliminar(transaccion: Transaccion) {
        guard let index = self.transacciones.firstIndex(of: transaccion) else {
            return
        }
        self.transacciones.remove(at: index)
    }
}
