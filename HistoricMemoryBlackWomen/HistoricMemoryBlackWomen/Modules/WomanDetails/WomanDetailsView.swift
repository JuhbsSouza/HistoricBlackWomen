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
    var image: AnyView
        
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                VStack {
                    image
                }
                .frame(maxHeight: 250)
                
                Text(woman.title)
                    .font(.title2).bold()
                    .foregroundStyle(Color.themePink)
                
                ScrollView(.vertical, showsIndicators: false) {
                    Text(woman.description.specialCharactersRemoved)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(1.2)
                }
            }
            .padding(24)
            .background(.white)
            .cornerRadius(6)
            .shadow(radius: 4)
        }
        .padding(30)
        .background(.secondaryYellow)
    }
}
