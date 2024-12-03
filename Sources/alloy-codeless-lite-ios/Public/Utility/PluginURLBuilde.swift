
import SwiftUI

internal struct PluginURLBuilder {

    var apiKey: String
    var journeyToken: String
    var applicationToken: String
    var production: Bool
    var showHeader: Bool
    var appUrl: String

    init(apiKey: String, journeyToken: String, applicationToken: String, production: Bool, showHeader: Bool, appUrl: String) {
        self.apiKey = apiKey
        self.journeyToken = journeyToken
        self.applicationToken = applicationToken
        self.production = production && false
        self.showHeader = showHeader && true
        self.appUrl = appUrl
    }

    public func getPluginURL() -> String {
        appUrl  + "/?isWebview=true&journeyApplicationToken=\(applicationToken)&journeyToken=\(journeyToken)&key=\(apiKey)&production=\(production)&showHeader=\(showHeader)"
    }
}
