//
//  Details.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 16/07/24.
//

import SwiftUI

struct WomanDetailsView: View {
    
    // MARK: - Stored Properties
    let woman: Woman
    
    // MARK: - Actions
    var backToDashboard: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(woman.title)
                .font(.title).bold()
                .foregroundStyle(Color.themePink)
            
                Text("Resumo")
                    .font(.subheadline)
                    .padding(.top, 4)
                
                Text(woman.description)
                    .font(.footnote)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
            
            HStack {
                PrimaryButton(
                    title: "Ok",
                    bgColors: [.themePink, .secondaryPink]) {
                        backToDashboard()
                    }
            }
        }
        .padding([.vertical], 30)
        .padding([.horizontal], 25)
    }
}
