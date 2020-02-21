//
//  Util.swift
//  VirtualWallet
//
//  Created by MacSpace on 2/20/20.
//  Copyright © 2020 Brahua. All rights reserved.
//

import Foundation

class Util {
    
    static func validarRegex(_ cadena: String, pattern: String) -> Bool {
        let range = NSRange(location: 0, length: cadena.count)
        var regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        } catch {
            print("validarExpresionRegular: Expresión regular inválida.")
            return false
        }
        
        let regexMatch = regex.firstMatch(in: cadena, options: [], range: range)
        return regexMatch == nil ? false : true
    }
}
