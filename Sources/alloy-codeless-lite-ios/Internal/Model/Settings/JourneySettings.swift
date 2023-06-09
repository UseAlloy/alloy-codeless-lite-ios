//
//  JourneySettings.swift
//  Alloy Codeless SDK
//
//

import Foundation

public class JourneySettings {

    public var journeyToken: String = ""
    public var journeyApplicationToken: String?
    public var entities: EntityData = EntityData(entities: [], additionalEntities: false)
    public var production: Bool = false;
    public var showDebugInfo: Bool = false
    init() {}

    public init(journeyToken: String, entities: EntityData, production: Bool, showDebugInfo: Bool = false) {
        self.journeyToken = journeyToken
        self.journeyApplicationToken = nil
        self.entities = entities
        self.production = production
        self.showDebugInfo = showDebugInfo
    }
    
    public init(journeyToken: String, journeyApplicationToken: String? = nil, production: Bool, showDebugInfo: Bool = false) {
        self.journeyToken = journeyToken
        self.journeyApplicationToken = journeyApplicationToken
        self.entities = EntityData(entities: [], additionalEntities: false)
        self.production = production
        self.showDebugInfo = showDebugInfo
    }
}
