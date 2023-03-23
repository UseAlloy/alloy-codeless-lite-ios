//
//  Entity.swift
//  Alloy Codeless SDK
//
//

import Foundation

public struct Entity: Codable {

    public struct EntityData: Codable {
        public let nameFirst: String
        public let nameLast: String

        // MARK: CodingKeys

        public enum CodingKeys: String, CodingKey {
            case nameFirst = "name_first"
            case nameLast = "name_last"
        }

        // MARK: Initializers

        public init(nameFirst: String, nameLast: String) {
            self.nameFirst = nameFirst
            self.nameLast = nameLast
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)

            nameFirst = try values.decode(String.self, forKey: .nameFirst)
            nameLast = try values.decode(String.self, forKey: .nameLast)
        }
    }

    let entityData: EntityData
    let entityType: String
    let branchName: String

    // MARK: CodingKeys

    public enum CodingKeys: String, CodingKey {
        case entityData = "data"
        case entityType = "entity_type"
        case branchName = "branch_name"
    }

    // MARK: Initializers

    public init(entityData: EntityData, entityType: String, branchName: String) {
        self.entityData = entityData
        self.entityType = entityType
        self.branchName = branchName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        entityData = try values.decode(EntityData.self, forKey: .entityData)
        entityType = try values.decode(String.self, forKey: .entityType)
        branchName = try values.decode(String.self, forKey: .branchName)
    }

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(entityData, forKey: .entityData)
        try container.encode(entityType, forKey: .entityType)
        try container.encode(branchName, forKey: .branchName)
    }

}
