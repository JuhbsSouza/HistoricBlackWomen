//
//  PrimaryButton.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 16/07/24.
//

import SwiftUI

struct PrimaryButton: View {
    
    // MARK: - Stored Properties
    var title: String
    var bgColors: [Color]
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(.white)
                .font(.headline)
                .padding(.horizontal, 25)
                .padding(.vertical, 8)
        }
        .background(Gradient(colors: bgColors))
        .cornerRadius(8)
    }
}

#Preview {
    PrimaryButton(
        title: "Ok",
        bgColors: [
            Color.themePink,
            Color.secondaryPink
        ],
        action: {}
    )
}
