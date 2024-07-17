//
//  String+Extensions.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import Foundation

extension String {
    
    var specialCharactersRemoved: String {
        var allowedCharacters = CharacterSet.alphanumerics
        allowedCharacters.insert(charactersIn: " .,")
        let filteredString = self.unicodeScalars.filter { allowedCharacters.contains($0) }
        return String(String.UnicodeScalarView(filteredString))
    }
}
