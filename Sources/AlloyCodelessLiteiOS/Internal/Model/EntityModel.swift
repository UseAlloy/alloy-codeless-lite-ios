//
//  EntityModel.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal struct EntityModel {
    var name: String?
    var type: String?
    var token: String?

    internal init(name: String?, type: String?, token: String?) {
        self.name = name
        self.type = type
        self.token = token
    }
}
