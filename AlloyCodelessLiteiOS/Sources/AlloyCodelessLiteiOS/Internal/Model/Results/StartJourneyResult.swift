//
//  JourneyInitResul.swift
//  Alloy Codeless SDK
//
//

import Foundation

public enum StartJourneyResultErrorCode {
    case RESULT_OK
    case RESULT_ERROR
}

public struct StartJourneyResult {

    public var resultCode: StartJourneyResultErrorCode?
    public var resultMessage: String?
    public var journeyResultData: JourneyDataResponse?
    public var internalError: [String: String]?

    init(resultCode: StartJourneyResultErrorCode? = nil, resultMessage: String? = nil, journeyResultData: JourneyDataResponse? = nil, internalError: [String: String] = [:]) {
        self.resultCode = resultCode
        self.resultMessage = resultMessage
        self.journeyResultData = journeyResultData
        self.internalError = internalError
    }
}
