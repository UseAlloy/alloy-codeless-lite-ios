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
    public var showDebugInfo: Bool = false
    init() {}

    public init(journeyToken: String, entities: EntityData, production: Bool, showDebugInfo: Bool = false) {
        self.journeyToken = journeyToken
        self.entities = entities
        self.production = production
        self.showDebugInfo = showDebugInfo
    }
}
