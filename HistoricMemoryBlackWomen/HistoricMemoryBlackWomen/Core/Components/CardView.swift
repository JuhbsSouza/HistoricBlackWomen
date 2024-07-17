//
//  CardView.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 15/07/24.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Stored Properties
    var name: String
    var image: AnyView
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            image
                .frame(maxWidth: 250, maxHeight: 250)
            
            VStack {
                Text(name)
                    .font(.headline).bold()
                    .foregroundStyle(.black)
            }
        }
        .frame(width: 280, height: 350)
        .padding(10)
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
