//
//  Entity.swift
//  Alloy Codeless SDK
//
//

import Foundation

public struct Entity: Codable {

    public struct EntityData: Codable {
        public let nameFirst: String?
        public let nameLast: String?
        public let  nameMiddle: String?
        public let  phoneNumber: String?
        public let  emailAddress: String?
        public let  addressLine1: String?
        public let  addressLine2: String?
        public let  addressCity: String?
        public let  addressState: String?
        public let  addressPostalCode: String?
        public let  addressCountryCode: String?
        public let  birthDate: String?
        public let  documentSsn: String?
        public let  documentIdCard: String?
        public let  documentLicense: String?
        public let  documentPassport: String?
        public let  gender: String?

        // MARK: CodingKeys

        public enum CodingKeys: String, CodingKey {
            case nameFirst = "name_first"
            case nameLast = "name_last"
            case nameMiddle = "name_middle"
            case phoneNumber = "phone_number"
            case emailAddress = "email_address"
            case addressLine1 = "address_line_1"
            case addressLine2 = "address_line_2"
            case addressCity = "address_city"
            case addressState = "address_state"
            case addressPostalCode = "address_postal_code"
            case addressCountryCode = "address_country_code"
            case birthDate = "birth_date"
            case documentSsn = "document_ssn"
            case documentIdCard = "document_id_card"
            case documentLicense = "document_license"
            case documentPassport = "document_passport"
            case gender = "gender"
        }

        // MARK: Initializers

        public init(
            nameFirst: String? = nil,
            nameLast: String? = nil,
            nameMiddle: String? = nil,
            phoneNumber: String? = nil,
            emailAddress: String? = nil,
            addressLine1: String? = nil,
            addressLine2: String? = nil,
            addressCity: String? = nil,
            addressState: String? = nil,
            addressPostalCode: String? = nil,
            addressCountryCode: String? = nil,
            birthDate: String? = nil,
            documentSsn: String? = nil,
            documentIdCard: String? = nil,
            documentLicense: String? = nil,
            documentPassport: String? = nil,
            gender: String? = nil) {
            self.nameFirst = nameFirst
            self.nameLast = nameLast
            self.nameMiddle = nameMiddle
            self.phoneNumber = phoneNumber
            self.emailAddress = emailAddress
            self.addressLine1 = addressLine1
            self.addressLine2 = addressLine2
            self.addressCity = addressCity
            self.addressState = addressState
            self.addressPostalCode = addressPostalCode
            self.addressCountryCode = addressCountryCode
            self.birthDate = birthDate
            self.documentSsn = documentSsn
            self.documentIdCard = documentIdCard
            self.documentLicense = documentLicense
            self.documentPassport = documentPassport
            self.gender = gender
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            nameFirst = try values.decodeIfPresent(String.self, forKey: .nameFirst)
            nameLast = try values.decodeIfPresent(String.self, forKey: .nameLast)
            nameMiddle = try values.decodeIfPresent(String.self, forKey: .nameMiddle)
            phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
            emailAddress = try values.decodeIfPresent(String.self, forKey: .emailAddress)
            addressLine1 = try values.decodeIfPresent(String.self, forKey: .addressLine1)
            addressLine2 = try values.decodeIfPresent(String.self, forKey: .addressLine2)
            addressCity = try values.decodeIfPresent(String.self, forKey: .addressCity)
            addressState = try values.decodeIfPresent(String.self, forKey: .addressState)
            addressPostalCode = try values.decodeIfPresent(String.self, forKey: .addressPostalCode)
            addressCountryCode = try values.decodeIfPresent(String.self, forKey: .addressCountryCode)
            birthDate = try values.decodeIfPresent(String.self, forKey: .birthDate)
            documentSsn = try values.decodeIfPresent(String.self, forKey: .documentSsn)
            documentIdCard = try values.decodeIfPresent(String.self, forKey: .documentIdCard)
            documentLicense = try values.decodeIfPresent(String.self, forKey: .documentLicense)
            documentPassport = try values.decodeIfPresent(String.self, forKey: .documentPassport)
            gender = try values.decodeIfPresent(String.self, forKey: .gender)
        }
    }

    let entityData: EntityData
    let entityType: String
    let branchName: String
    let externalEntityId: String?


    // MARK: CodingKeys

    public enum CodingKeys: String, CodingKey {
        case entityData = "data"
        case entityType = "entity_type"
        case branchName = "branch_name"
        case externalEntityId = "external_entity_id"
    }

    // MARK: Initializers

    public init(entityData: EntityData, entityType: String, branchName: String, externalEntityId: String? = nil) {
        self.entityData = entityData
        self.entityType = entityType
        self.branchName = branchName
        self.externalEntityId = externalEntityId
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        entityData = try values.decode(EntityData.self, forKey: .entityData)
        entityType = try values.decode(String.self, forKey: .entityType)
        branchName = try values.decode(String.self, forKey: .branchName)
        externalEntityId = try values.decodeIfPresent(String.self, forKey: .externalEntityId)
    }

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(entityData, forKey: .entityData)
        try container.encode(entityType, forKey: .entityType)
        try container.encode(branchName, forKey: .branchName)
        try container.encodeIfPresent(externalEntityId, forKey: .externalEntityId)
    }

}
