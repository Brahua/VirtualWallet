//
//  TransaccionViewModel.swift
//  VirtualWallet
//
//  Created by solmit on 6/24/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation
import FirebaseFirestore

class TransaccionViewModel {
    private var transacciones: [Transaccion] = []
    
    private var db: Firestore {
        let db = Firestore.firestore()
        
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        settings.isPersistenceEnabled = true
        
        db.settings = settings
        return db
    }
    
    var totalTransacciones: Int {
        return transacciones.count
    }
    
    init() {
        db.collection("transacciones").getDocuments { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.transacciones.removeAll()
            
            try? snapshot?.documents.forEach({ (queryDocSnapshot) in
                let json = queryDocSnapshot.data()
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                
                guard let transaccion = try? JSONDecoder().decode(Transaccion.self, from: jsonData) else {
                    return
                }
                
                self.transacciones.append(transaccion)
            })
            
        }
    }
    
}
