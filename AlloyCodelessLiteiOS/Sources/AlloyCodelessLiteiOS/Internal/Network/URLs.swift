//
//  URLs.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal struct URLs {
    
    static func getApi(_ alloySettings: AlloySettings) -> String {
        if alloySettings.realProduction {
            return "https://docv.alloy.co"
        }
        return "https://docv-dev-api.alloy.co/"
    }
    
}
