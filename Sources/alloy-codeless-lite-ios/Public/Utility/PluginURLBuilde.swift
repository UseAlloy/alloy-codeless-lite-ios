
import SwiftUI

internal struct PluginURLBuilder {

    var apiKey: String
    var journeyToken: String
    var applicationToken: String
    var entityToken: String
    var isSingleEntity: Bool
    var production: Bool
    var showHeader: Bool
    var appUrl: String
    var customTheme: CustomTheme?
    var componentOverride: ComponentOverride?

    init(apiKey: String, journeyToken: String, applicationToken: String, entityToken: String,
         isSingleEntity: Bool, production: Bool, showHeader: Bool, appUrl: String, customTheme: CustomTheme?, componentOverride: ComponentOverride?) {
        self.apiKey = apiKey
        self.journeyToken = journeyToken
        self.applicationToken = applicationToken
        self.entityToken = entityToken
        self.isSingleEntity = isSingleEntity && false
        self.production = production && false
        self.showHeader = showHeader && true
        self.appUrl = appUrl
        self.customTheme = customTheme
        self.componentOverride = componentOverride
    }
    
    func serialize(object: Codable) -> String {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(object)
            
            
            // Convert JSON data to a string
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                // Percent-encode the JSON string for a URL
                return jsonString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            }
        } catch {
            print("Failed to encode JSON: \(error)")
        }
        return ""
    }

    public func getPluginURL() -> String {
        var finalUrl = appUrl  + "/?isWebview=true&journeyApplicationToken=\(applicationToken)&journeyToken=\(journeyToken)&key=\(apiKey)&production=\(production)&showHeader=\(showHeader)"
        if (entityToken != "") { finalUrl += "&entityToken=\(entityToken)" }
        if (isSingleEntity == true) { finalUrl += "&singleEntity=true" }
        
        // Set the global theme
        let theme = serialize(object: customTheme ?? CustomTheme())
        if (theme != "") { finalUrl += "&theme=\(theme)" }
        
        // Set the global component override
        let component = serialize(object: componentOverride ?? ComponentOverride())
        if (component != "") { finalUrl += "&componentOverride=\(component)" }
        
        return finalUrl
    }
}
