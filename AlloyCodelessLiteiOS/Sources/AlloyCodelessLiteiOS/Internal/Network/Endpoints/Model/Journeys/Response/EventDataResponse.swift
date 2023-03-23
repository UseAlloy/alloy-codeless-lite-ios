//
//  EventDataResponse.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal struct EventDataResponse: Codable {

    let entityToken: String?
    let type: String?
    let timestamp: Date?
    let emebeddedNode: NodeDataResponse?

    // MARK: CodingKeys

    internal enum CodingKeys: String, CodingKey {
        case entityToken = "entity_token"
        case type = "type"
        case timestamp = "timestamp"
        case emebeddedNode = "_embedded"
    }

}
