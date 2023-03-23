//
//  View.swift
//  
//
//

import SwiftUI

internal extension View {

    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }

    func dismiss() {
        UIApplication
            .shared
            .keyWindow?
            .rootViewController?
            .dismiss(animated: true, completion: nil)
    }
}

