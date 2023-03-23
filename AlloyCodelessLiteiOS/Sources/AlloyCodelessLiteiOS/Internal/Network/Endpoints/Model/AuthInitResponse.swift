//
//  AuthInitResponse.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal struct AuthInitResponse: Codable {
    
    let accessToken: String

    // MARK: CodingKeys

    internal enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
