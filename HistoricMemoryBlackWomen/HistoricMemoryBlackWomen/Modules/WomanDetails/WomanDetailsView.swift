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
        VStack {
            Spacer()
            
            Text(woman.title)
                .font(.title2).bold()
                .foregroundStyle(Color.themePink)
                .padding(.bottom, 30)
                        
            Text(woman.description.specialCharactersRemoved)
                .font(.footnote)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            PrimaryButton(
                title: "Ok",
                bgColors: [.themePink, .secondaryPink]) {
                    backToDashboard()
                }
        }
        .padding(30)
    }
}
