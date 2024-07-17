//
//  Page.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 16/07/24.
//

import SwiftUI

enum Page: Hashable, Identifiable {
    case dashboard
    case womanDetails(woman: Woman)
    
    // MARK: - Computed Properties
    var id: UUID {
        return UUID()
    }
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .womanDetails:
            return "Detalhes"
        }
    }
}

