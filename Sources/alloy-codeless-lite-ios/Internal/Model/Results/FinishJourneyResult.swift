//
//  FinishJourneyResult.swift
//  Alloy Codeless SDK
//
//

import Foundation

public struct FinishJourneyResult {
    
    public let finishResultCode: String
    public let finishResultMessage: String
    public let journeyResultData: JourneyDataResponse?
    
    init(finishResultCode: String, finishResultMessage: String, journeyResultData: JourneyDataResponse? = nil) {
        self.finishResultCode = finishResultCode
        self.finishResultMessage = finishResultMessage
        self.journeyResultData = journeyResultData
    }
}
