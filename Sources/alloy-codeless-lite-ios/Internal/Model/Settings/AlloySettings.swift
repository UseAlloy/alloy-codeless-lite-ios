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

    public init() {}

    public init(apiKey: String? = nil, production: Bool = false, realProduction: Bool = false, codelessFinalValidation: Bool = false, showHeader: Bool? = true, showDebugInfo: Bool = false) {
        self.apiKey = apiKey
        self.production = production
        self.realProduction = realProduction
        self.codelessFinalValidation = codelessFinalValidation
        self.showHeader = showHeader
        self.showDebugInfo = showDebugInfo
    }

}
