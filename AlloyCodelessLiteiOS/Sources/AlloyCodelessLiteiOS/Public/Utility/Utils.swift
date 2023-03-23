//
//  Utils.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal struct Utils {

    // MARK: Methods

    internal static func NSLocalizedString(_ key: String) -> String {
        return Foundation.NSLocalizedString(key, tableName: nil, bundle: Bundle(identifier: Bundle.module.bundleIdentifier ?? "") ?? Bundle.main, value: "", comment: "")
    }
}
