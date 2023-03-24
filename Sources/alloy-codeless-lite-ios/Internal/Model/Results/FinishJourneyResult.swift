//
//  FinishJourneyResult.swift
//  Alloy Codeless SDK
//
//

import Foundation

public enum FinishJourneyResultCode {
    case FINISH_RESULT_CANCEL
    case FINISH_RESULT_COMPLETED
        // DocV Result
    case FINISH_RESULT_APPROVED
    case FINISH_RESULT_DENIED
    case FINISH_RESULT_ERROR
    case FINISH_RESULT_OK
    case FINISH_RESULT_REVIEW
}

public struct FinishJourneyResult {
    
    public let finishResultCode: FinishJourneyResultCode
    public let finishResultMessage: String
    public let journeyResultData: JourneyDataResponse?
    
    init(finishResultCode: FinishJourneyResultCode, finishResultMessage: String, journeyResultData: JourneyDataResponse? = nil) {
        self.finishResultCode = finishResultCode
        self.finishResultMessage = finishResultMessage
        self.journeyResultData = journeyResultData
    }
}
