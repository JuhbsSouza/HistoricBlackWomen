//
//  GetWomanListProtocol.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import Foundation

protocol GetWomanListProtocol {
    func getWomanList() async -> [Woman]?
}

class GetWomanListProtocolService: GetWomanListProtocol {
    
    private let service = Services()
    
    func getWomanList() async -> [Woman]? {
        await service.getWomanList()
    }
}
