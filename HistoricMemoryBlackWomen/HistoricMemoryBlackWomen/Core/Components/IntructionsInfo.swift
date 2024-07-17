//
//  IntructionsInfo.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import SwiftUI

struct IntructionsInfo: View {
    
    // MARK: - Stored Properties
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundStyle(.secondaryPink)
            .font(.footnote)
            .padding(8)
    }
}

#Preview {
    IntructionsInfo(
        message: "Saber mais")
}
