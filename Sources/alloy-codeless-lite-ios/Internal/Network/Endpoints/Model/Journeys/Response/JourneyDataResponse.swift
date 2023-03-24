//
//  JourneyDataResponse.swift
//  Alloy Codeless SDK
//
//

import Foundation

public struct JourneyDataResponse: Codable {

    struct EmbebedDataJourney: Codable {

        let childEntities: [EntityDataResponse]?
        let events: [EventDataResponse]?

        // MARK: CodingKeys

        internal enum CodingKeys: String, CodingKey {
            case childEntities = "child_entities"
            case events = "events"
        }
    }

    internal struct JourneyErrorResponse: Codable {

        let typeError: String?
        let messageError: String?

        // MARK: CodingKeys

        internal enum CodingKeys: String, CodingKey {
            case typeError = "type"
            case messageError = "message"
        }
    }

    let journeyApplicationStatus: String?
    let status: String?
    let timestamp: Date?
    let embedded: EmbebedDataJourney?
    let statusCodeError: Int?
    let journeyError: JourneyErrorResponse?

    // MARK: CodingKeys

    internal enum CodingKeys: String, CodingKey {
        case status = "status"
        case timestamp = "timestamp"
        case journeyApplicationStatus = "journey_application_status"
        case embedded = "_embedded"
        case statusCodeError = "status_code"
        case journeyError = "error"
    }

    // MARK: Initializers

    init(journeyApplicationStatus: String? = nil, status: String? = nil, timestamp: Date? = nil, embedded: EmbebedDataJourney? = nil, statusCodeError: Int? = nil, journeyError: JourneyErrorResponse? = nil) {
        self.journeyApplicationStatus = journeyApplicationStatus
        self.status = status
        self.timestamp = timestamp
        self.embedded = embedded
        self.statusCodeError = statusCodeError
        self.journeyError = journeyError
    }
}
