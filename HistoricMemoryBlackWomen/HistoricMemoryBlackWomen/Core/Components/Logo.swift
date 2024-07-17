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
                .frame(width: 60, height: 50)
                .foregroundColor(iconColor)
                .padding(.top, 40)

            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    Logo(
        title: "Mulheres negras da história",
        iconName: "crown.fill",
        iconColor: Color.themeYellow
    )}
