
import SwiftUI

internal struct PluginURLBuilder {

    let baseUrl = "https://alloysdk.alloy.co/?isNext=true&"
    var apiKey: String
    var journeyToken: String
    var applicationToken: String
    var production: Bool
    var showHeader: Bool

    init(apiKey: String, journeyToken: String, applicationToken: String, production: Bool, showHeader: Bool) {
        self.apiKey = apiKey
        self.journeyToken = journeyToken
        self.applicationToken = applicationToken
        self.production = production && false
        self.showHeader = showHeader && true
    }

    public func getPluginURL() -> String {
        baseUrl  + "journeyApplicationToken=\(applicationToken)&journeyToken=\(journeyToken)&key=\(apiKey)&production=\(production)&showHeader=\(showHeader)"
    }
}
