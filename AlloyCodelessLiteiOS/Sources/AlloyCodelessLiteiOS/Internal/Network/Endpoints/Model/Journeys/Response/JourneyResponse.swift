//
//  JourneyResponse.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal struct JourneyResponse: Codable {

    internal struct JourneyErrorResponse: Codable {

        let typeError: String?
        let messageError: String?

        // MARK: CodingKeys

        internal enum CodingKeys: String, CodingKey {
            case typeError = "type"
            case messageError = "message"
        }
    }

    let journeyApplicationToken: String?
    let statusCodeError: Int?
    let journeyError: JourneyErrorResponse?

    // MARK: CodingKeys

    internal enum CodingKeys: String, CodingKey {
        case journeyApplicationToken = "journey_application_token"
        case statusCodeError = "status_code"
        case journeyError = "error"
    }
}
