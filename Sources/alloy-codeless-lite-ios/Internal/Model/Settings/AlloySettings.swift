//
//  AlloySettings.swift
//  Alloy Codeless SDK
//
//

import Foundation



public class AlloySettings {

    // MARK: - Properties
    // Mandatory API Key
    public var apiKey: String?

    // Configure SDK with production environment (default is false)
    public var production = false

    // Configure SDK for make tests in environment (default is true)
    public var realProduction = true

    public var codelessFinalValidation = false
    
    public var showHeader: Bool? = true
    
    public var showDebugInfo: Bool = false
    
    public var journeyToken: String?
    
    public var journeyApplicationToken: String?
    
    public var appUrl: String = "https://alloysdk.alloy.co"
    
    public var apiUrl: String = "https://docv.alloy.co"
    
    public var entityToken: String?
    
    public var isSingleEntity: Bool?
    
    public var customTheme: CustomTheme?
    
    public var componentOverride: ComponentOverride?

    public init() {}

    public init(apiKey: String? = nil, production: Bool = false, realProduction: Bool = false, codelessFinalValidation: Bool = false, showHeader: Bool? = true, showDebugInfo: Bool = false, journeyToken: String, journeyApplicationToken: String?, appUrl: String? = nil, apiUrl: String? = nil, entityToken: String? = nil, isSingleEntity: Bool? = false, customTheme: CustomTheme? = nil, componentOverride: ComponentOverride? = nil ) {
        self.apiKey = apiKey
        self.production = production
        self.realProduction = realProduction
        self.codelessFinalValidation = codelessFinalValidation
        self.showHeader = showHeader
        self.showDebugInfo = showDebugInfo
        self.journeyToken = journeyToken
        self.journeyApplicationToken = journeyApplicationToken
        self.appUrl = appUrl ?? "https://alloysdk.alloy.co"
        self.apiUrl = apiUrl ?? "https://docv.alloy.co"
        self.entityToken = entityToken
        self.isSingleEntity = isSingleEntity
        self.customTheme = customTheme
        self.componentOverride = componentOverride
    }

}
