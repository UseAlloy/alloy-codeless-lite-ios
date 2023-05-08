
import SwiftUI

internal struct PluginURLBuilder {

    let baseUrl = "https://alloysdk.alloy.co/?isNext=true&"
    var apiKey: String
    var journeyToken: String
    var applicationToken: String
    var production: Bool

    init(apiKey: String, journeyToken: String, applicationToken: String, production: Bool) {
        self.apiKey = apiKey
        self.journeyToken = journeyToken
        self.applicationToken = applicationToken
        self.production = production && false
    }

    public func getPluginURL() -> String {
        baseUrl  + "journeyApplicationToken=\(applicationToken)&journeyToken=\(journeyToken)&key=\(apiKey)&production=\(production)"
    }
}
