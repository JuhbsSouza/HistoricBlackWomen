//
//  CarouselItemView.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import SwiftUI

struct CarouselItemView<Content: View>: View, Identifiable, Hashable {
    
    let id: UUID = UUID()
    let view: Content
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: CarouselItemView<Content>, rhs: CarouselItemView<Content>) -> Bool {
        lhs.id == rhs.id
    }
    
    var body: some View {
        view
    }
}

#Preview {
    CarouselItemView(view: VStack{})
}

