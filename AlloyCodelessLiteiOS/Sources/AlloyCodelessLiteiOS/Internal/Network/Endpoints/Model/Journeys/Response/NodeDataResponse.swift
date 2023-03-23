//
//  NodeDataResponse.swift
//  Alloy Codeless SDK
//
//

import Foundation


internal struct NodeDataResponse: Codable {

    struct SDKConfig: Codable {
        let pluging: String?
        let documents: [String]?
        let validationPrecheck: Bool?
        let forceMobile: Bool?
        let selfie: Bool?
        let socurePublicKey: String?

        // MARK: CodingKeys

        internal enum CodingKeys: String, CodingKey {
            case pluging = "plugin"
            case documents = "documents"
            case validationPrecheck = "validation_precheck"
            case forceMobile = "force_mobile"
            case selfie = "selfie"
            case socurePublicKey = "socure_public_key"
        }

        // MARK: Initializers

        init(pluging: String?, documents: [String]?, validationPrecheck: Bool?, forceMobile: Bool?, selfie: Bool?, socurePublicKey: String?) {
            self.pluging = pluging
            self.documents = documents
            self.validationPrecheck = validationPrecheck
            self.forceMobile = forceMobile
            self.selfie = selfie
            self.socurePublicKey = socurePublicKey
        }
    }

    struct NodeResponse: Codable {

        let workflowName: String?
        let sdkConfig: SDKConfig?

        // MARK: CodingKeys

        internal enum CodingKeys: String, CodingKey {
            case workflowName = "workflow_name"
            case sdkConfig = "sdk_config"
        }
    }

    let node: NodeResponse?

    // MARK: CodingKeys

    internal enum CodingKeys: String, CodingKey {
        case node = "node"
    }

}
