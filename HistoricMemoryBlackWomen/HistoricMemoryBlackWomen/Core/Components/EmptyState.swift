//
//  EmptyState.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import SwiftUI

struct EmptyState: View {
    
    // MARK: - Stored Properties
    var message: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .font(.title3)
                .foregroundStyle(.themeYellow)
            Spacer()
        }
    }
}

#Preview {
    EmptyState(
        message: "Carregando")
}
