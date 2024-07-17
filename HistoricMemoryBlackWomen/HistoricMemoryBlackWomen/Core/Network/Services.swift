//
//  Services.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import Foundation

class Services: GetWomanListProtocol {
    
    func getWomanList() async -> [Woman]? {
        guard let url = API.blackWomen.url else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedList = try decoder.decode(WomanResponse.self, from: data)
            
            return decodedList.content
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
        return nil
    }
}
