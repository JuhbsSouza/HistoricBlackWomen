//
//  Dashboard.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 15/07/24.
//

import SwiftUI

struct Dashboard: View {
    
    // MARK: - Wrapped Properties
    @StateObject var viewModel = DashboardViewModel()
    @State var currentIndex: Int = 0
    
    // MARK: - Actions
    var goToDetailsAction: ((Woman) -> Void)
    
    var body: some View {
        VStack {
            Logo(
                title: "Mulheres negras da história",
                iconName: "crown.fill",
                iconColor: Color.themeYellow
            )
            
            Spacer()
            
            if let womenList = viewModel.womenListFilteredByImage {
                CarouselView(
                    currentIndex: $currentIndex,
                    spacing: 0,
                    cardPadding: 30,
                    items: womenList,
                    id: \.self) { woman, _  in
                        CardView(
                            name: woman.title,
                            image: AnyView(getImageByUrl(url: (woman.metadata?.image!.url)!))
                        )
                        .onTapGesture {
                            goToDetailsAction(woman)
                        }
                    }
                    .padding(.horizontal)
                IntructionsInfo(
                    message: "Clique no cartão para saber mais"
                )
            } else {
                EmptyState(message: "Carregando lista...")
            }
        }
        .task {
            await viewModel.populateWomenList()
        }
    }
}

#Preview {
    Dashboard(goToDetailsAction: { _ in })
}
