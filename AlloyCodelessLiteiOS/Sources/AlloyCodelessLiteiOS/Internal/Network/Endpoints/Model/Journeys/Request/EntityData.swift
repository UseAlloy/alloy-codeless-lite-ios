//
//  Entities.swift
//  Alloy Codeless SDK
//
//

import Foundation

public struct EntityData: Codable {

    let entities: [Entity]
    let additionalEntities: Bool

    // MARK: CodingKeys

    public enum CodingKeys: String, CodingKey {
        case entities = "entities"
        case additionalEntities = "do_await_additional_entities"
    }

    // MARK: Initializers

    public init(entities:[Entity], additionalEntities: Bool) {
        self.entities = entities
        self.additionalEntities = additionalEntities
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        entities = try values.decode([Entity].self, forKey: .entities)
        additionalEntities = try values.decode(Bool.self, forKey: .additionalEntities)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(entities, forKey: .entities)
        try container.encode(additionalEntities, forKey: .additionalEntities)
    }
}
