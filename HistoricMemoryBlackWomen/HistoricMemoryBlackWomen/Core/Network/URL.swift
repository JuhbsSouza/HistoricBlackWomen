//
//  URL.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 16/07/24.
//

import Foundation

enum API: String {
    
    case blackWomen
    
    var url: URL? {
        switch self {
        case .blackWomen:
            return URL(string: "https://theblackwomanhistory.firebaseio.com/.json")
        }
    }
}
