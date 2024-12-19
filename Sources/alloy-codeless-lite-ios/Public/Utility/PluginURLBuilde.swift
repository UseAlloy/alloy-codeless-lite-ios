
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

    init(apiKey: String, journeyToken: String, applicationToken: String, entityToken: String,
         isSingleEntity: Bool, production: Bool, showHeader: Bool, appUrl: String) {
        self.apiKey = apiKey
        self.journeyToken = journeyToken
        self.applicationToken = applicationToken
        self.entityToken = entityToken
        self.isSingleEntity = isSingleEntity
        self.production = production && false
        self.showHeader = showHeader && true
        self.appUrl = appUrl
       
    }

    public func getPluginURL() -> String {
        var finalUrl = appUrl  + "/?isWebview=true&journeyApplicationToken=\(applicationToken)&journeyToken=\(journeyToken)&key=\(apiKey)&production=\(production)&showHeader=\(showHeader)"
        if (entityToken != "") { finalUrl += "&entityToken=\(entityToken)" }
        if (isSingleEntity == true) { finalUrl += "&singleEntity=true" }
        return finalUrl
    }
}
