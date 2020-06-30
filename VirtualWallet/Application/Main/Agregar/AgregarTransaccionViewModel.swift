//
//  AgregarTransaccionViewModel.swift
//  VirtualWallet
//
//  Created by solmit on 6/24/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation
import FirebaseFirestore

class AgregarTransaccionViewModel {
    private var db: Firestore {
        let db = Firestore.firestore()
        
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        settings.isPersistenceEnabled = true
        
        db.settings = settings
        return db
    }
    
    func agregar(nombre: String, descripcion: String, valor: String) {
        guard let valor = Float(valor) else {
            return
        }
        
        let transaccion = Transaccion(valor: valor, categoria: .gasto, descripcion: descripcion, fecha: Date())
        
        guard let data = transaccion.data() else {
            return
        }
        
        self.db.collection("transaccion").addDocument(data: data)
    }
}
