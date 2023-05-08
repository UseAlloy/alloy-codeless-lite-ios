//
//  JourneySettings.swift
//  Alloy Codeless SDK
//
//

import Foundation

public class JourneySettings {

    public var journeyToken: String = ""
    public var entities: EntityData = EntityData(entities: [], additionalEntities: false)
    public var production: Bool = false;
    init() {}

    public init(journeyToken: String, entities: EntityData, production: Bool) {
        self.journeyToken = journeyToken
        self.entities = entities
        self.production = production
    }

    public func getFirstNameEntity(withIndex i: Int) -> String {
        return entities.entities[i].entityData.nameFirst
    }

    public func getLastNameEntity(withIndex i: Int) -> String {
        return entities.entities[i].entityData.nameLast

    }
}
