//
//  DashboardViewModel.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 15/07/24.
//

import SwiftUI

class DashboardViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var womenList: [Woman]?
    var service: GetWomanListProtocol = GetWomanListProtocolService()
    
    // MARK: - Computed Properties
    var womenListFilteredByImage: [Woman]? {
        womenList?.filter({ $0.metadata?.image?.url != nil })
    }
    
    // MARK: - Network methods
    func populateWomenList() async {
        let remoteWomanList = await service.getWomanList()
        DispatchQueue.main.async {
            self.womenList = remoteWomanList
        }
    }
}
