//
//  TokenHolder.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal class TokenHolder {

    static public var tokens = TokenHolder()

    var accessToken: String = ""

    var journeyApplicationToken: String = ""

    public init() { }

    public init(accessToken: String, journeyApplicationToken: String) {
        self.accessToken = accessToken
        self.journeyApplicationToken = journeyApplicationToken
    }
}
