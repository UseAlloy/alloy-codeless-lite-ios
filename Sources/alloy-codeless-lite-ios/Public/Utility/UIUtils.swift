//
//  UIUtils.swift
//  AlloyCodelessDemo
//
//

import SwiftUI
import UIKit

internal struct UIUtils {

    @MainActor
    static func dismissCurrentView() {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last?.rootViewController?.presentedViewController?.dismiss(animated: true)
    }
    
    @MainActor
    static func presentView(viewController: UIHostingController<some View>, presentationStyle: UIModalPresentationStyle) {
        let topViewController = UIUtils.topMostController()
        viewController.modalPresentationStyle = presentationStyle
        topViewController?.present(viewController, animated: true)
    }

    @MainActor
    static internal func topMostController() -> UIViewController? {
        guard
            let window = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first,
            let rootViewController = window.rootViewController else {
            return nil
        }

        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }

        return topController
    }
}
