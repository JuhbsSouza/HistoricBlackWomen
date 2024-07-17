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
        VStack {
            image
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            VStack {
                Text(name)
                    .font(.headline).bold()
                    .foregroundStyle(.black)
                    .padding(.vertical, 12)
                    .multilineTextAlignment(.center)
            }
            .background(.white)
            .padding(.bottom, 10)
        }
        .frame(width: 300, height: 400)
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 6)
    }
}
