    //
    //  AuthInitResult.swift
    //  Alloy Codeless SDK
    //
    //

import Foundation

public enum AuthInitResultErrorCode {
    case RESULT_OK
    case RESULT_ERROR
}

public struct AuthInitResult {

    public let resultCode: AuthInitResultErrorCode
    public let resultMessage: String

    init(_ resultCode: AuthInitResultErrorCode, _ resultMessage: String) {
        self.resultCode = resultCode
        self.resultMessage = resultMessage
    }
}

