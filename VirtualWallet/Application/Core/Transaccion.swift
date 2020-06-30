//
//  Transaccion.swift
//  VirtualWallet
//
//  Created by solmit on 6/24/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation

public class Transaccion: Codable {
    var uuid = UUID()
    var valor: Float
    var categoria: CategoriaTransaccion
    var descripcion: String
    var fecha: Date?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case valor
        case categoria
        case descripcion
        case fecha
    }
    
    public init(valor: Float, categoria: CategoriaTransaccion, descripcion: String, fecha: Date) {
        self.valor = valor;
        self.categoria = categoria;
        self.descripcion = descripcion;
        self.fecha = fecha;
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uuid = try container.decode(UUID.self, forKey: .uuid)
        valor = try container.decode(Float.self, forKey: .valor)
        categoria = try container.decode(CategoriaTransaccion.self, forKey: .categoria)
        descripcion = try container.decode(String.self, forKey: .descripcion)
        fecha = try container.decode(Date.self, forKey: .fecha)
    }
    
    public func data() -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(self) else {
            return nil
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        
        return json
    }
    
}

extension Transaccion: Hashable {
    public static func == (lhs: Transaccion, rhs: Transaccion) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    public var hashValue: Int {
        return uuid.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        
    }
}
