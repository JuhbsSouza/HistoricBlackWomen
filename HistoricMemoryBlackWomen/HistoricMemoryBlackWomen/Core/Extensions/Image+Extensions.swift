//
//  Image+Extensions.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import SwiftUI

extension View {
    
    func getImageByUrl(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .empty:
                ProgressView()
            case .failure:
                EmptyView()
            @unknown default:
                EmptyView()
            }
        }
    }
}
