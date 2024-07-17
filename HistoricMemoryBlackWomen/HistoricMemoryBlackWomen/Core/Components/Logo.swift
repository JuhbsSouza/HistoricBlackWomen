//
//  Title.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 15/07/24.
//

import SwiftUI

struct Logo: View {
    
    // MARK: - Stored Properties
    let title: String
    let iconName: String
    let iconColor: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 40, height: 30)
                .foregroundColor(iconColor)
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .padding(.top, 20)
    }
}

#Preview {
    Logo(
        title: "Mulheres negras da história",
        iconName: "crown.fill",
        iconColor: Color.secondaryYellow
    )}
