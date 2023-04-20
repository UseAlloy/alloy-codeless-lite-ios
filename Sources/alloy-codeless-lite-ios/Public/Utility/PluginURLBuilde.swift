
import SwiftUI

internal struct PluginURLBuilder {

    let baseUrl = "https://alloysdk.alloy.co/?isNext=true&"
    var apiKey: String
    var journeyToken: String
    var applicationToken: String

    init(apiKey: String, journeyToken: String, applicationToken: String) {
        self.apiKey = apiKey
        self.journeyToken = journeyToken
        self.applicationToken = applicationToken
    }

    public func getPluginURL() -> String {
        baseUrl  + "journeyApplicationToken=\(applicationToken)&journeyToken=\(journeyToken)&key=\(apiKey)"
    }
}
