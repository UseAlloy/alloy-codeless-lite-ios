    //
    //  StatusJourney.swift
    //  Alloy Codeless SDK
    //
    //

import Foundation

internal enum StatusJourney: String, Codable {
    case STARTED
    case PENDING
    case RUNNING
    case STARTED_EVALUATION
    case COMPLETED

    internal init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        switch value.lowercased() {
            case "started_application":
                self = .STARTED
            case "pending_documents", "pending_step_up", "data_request":
                self = .PENDING
            case "running":
                self = .RUNNING
            case "started_evaluation":
                self = .STARTED_EVALUATION
            case "completed", "completed_evaluation", "completed_branch":
                self = .COMPLETED
            default:
                self = .PENDING
        }
    }

    internal init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "started_application":
            self = .STARTED
        case "pending_documents", "pending_step_up", "data_request":
            self = .PENDING
        case "running":
            self = .RUNNING
        case "started_evaluation":
            self = .STARTED_EVALUATION
        case "completed", "completed_evaluation", "completed_branch":
            self = .COMPLETED
        default:
            self = .PENDING
        }
    }
}

