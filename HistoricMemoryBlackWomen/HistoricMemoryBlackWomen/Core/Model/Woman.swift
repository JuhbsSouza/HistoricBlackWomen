//
//  Woman.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 15/07/24.
//

import Foundation

struct Woman: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let description: String
    let metadata: WomanMetadata?
}

struct WomanResponse: Codable, Hashable {
    var content: [Woman]
}

struct WomanMetadata: Codable, Hashable {
    var image: WomanImage?
}

struct WomanImage: Codable, Hashable {
    var url: String
}
