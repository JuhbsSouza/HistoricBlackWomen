//
//  MainNavigation.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import SwiftUI

struct MainNavigation: View {
    
    @State var path = NavigationPath()
    @State var sheet: Page?
    
    // MARK: - Content
    var body: some View {
        NavigationStack(path: $path) {
            build(page: .dashboard)
                .navigationDestination(for: Page.self) { page in
                    withAnimation {
                        build(page: page)
                    }
                }
                .sheet(item: $sheet) { sheet in
                    build(page: sheet)
                }
        }
    }
}

// MARK: - Navigation Methods
extension MainNavigation {
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Page) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
}

// MARK: - View Builder Methods
extension MainNavigation {
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .dashboard:
            Dashboard(goToDetailsAction: { woman in
                present(sheet: .womanDetails(woman: woman))
            })
        case .womanDetails(let woman):
            WomanDetailsView(
                woman: woman,
                backToDashboard: dismissSheet
            )
        }
    }
}

#Preview {
    MainNavigation()
}
