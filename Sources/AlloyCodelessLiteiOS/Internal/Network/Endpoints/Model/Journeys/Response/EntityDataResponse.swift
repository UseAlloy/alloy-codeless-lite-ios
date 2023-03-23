//
//  EntityDataResponse.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal struct EntityDataResponse: Codable {

    let name: String?
    let token: String?
    let type: String?
    let entityApplicationStatus: String?

    // MARK: CodingKeys

    internal enum CodingKeys: String, CodingKey {
        case name = "name"
        case token = "token"
        case type = "type"
        case entityApplicationStatus = "entity_application_status"
    }
}
