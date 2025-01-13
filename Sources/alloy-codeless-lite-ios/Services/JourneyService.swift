//
//  JourneyService.swift
//  AlloyCodelessDemo
//
//

import Foundation

internal struct JourneyService {

    var journeySettings = JourneySettings()
    var onFinish: ((FinishJourneyResult) -> Void)? = nil

    @MainActor
    internal mutating func startJourney(journeySettings: JourneySettings, onFinish: @escaping (FinishJourneyResult?) -> Void) async throws -> StartJourneyResult? {
        self.onFinish = onFinish
        self.journeySettings = journeySettings
        
        if let journeyApplicationToken = journeySettings.journeyApplicationToken {
            TokenHolder.tokens.journeyApplicationToken = journeyApplicationToken
        }
        
        let result = journeySettings.journeyApplicationToken == nil ? try await createJourney() : try await getStatusJourney()
        if result.resultCode == .RESULT_OK, result.journeyResultData != nil {
            let urlPlugin = PluginURLBuilder(
                apiKey: AlloyCodelessLiteiOS.shared.alloySettings.apiKey ?? "",
                journeyToken: journeySettings.journeyToken,
                applicationToken: TokenHolder.tokens.journeyApplicationToken,
                entityToken: AlloyCodelessLiteiOS.shared.alloySettings.entityToken ?? "",
                isSingleEntity: AlloyCodelessLiteiOS.shared.alloySettings.isSingleEntity ?? false,
                production: journeySettings.production,
                showHeader:  AlloyCodelessLiteiOS.shared.alloySettings.showHeader ?? true,
                appUrl: AlloyCodelessLiteiOS.shared.alloySettings.appUrl,
                customTheme: AlloyCodelessLiteiOS.shared.alloySettings.customTheme,
                componentOverride: AlloyCodelessLiteiOS.shared.alloySettings.componentOverride
            )

            guard let topVC = UIUtils.topMostController() else { return result }

            UIUtils.presentView(viewController: WebViewController(url: urlPlugin.getPluginURL(), onFinish: onFinish, presenter: topVC), presentationStyle: .overFullScreen)
        }
        return result
    }

    internal func createJourney() async throws -> StartJourneyResult {
        let result = try await JourneyEndpoint
            .createJourney(
                settings: AlloyCodelessLiteiOS.shared.alloySettings,
                journeySettings: journeySettings)
            .request(type: JourneyResponse.self)

        if result.statusCodeError != nil {
            return StartJourneyResult(resultCode: StartJourneyResultErrorCode.RESULT_ERROR, resultMessage: result.journeyError?.messageError ?? "")
        } else if result.journeyApplicationToken?.isEmpty ?? true {
            return StartJourneyResult(resultCode: StartJourneyResultErrorCode.RESULT_ERROR, resultMessage: "No journey application token was returned from the server.")
        } else {
            TokenHolder.tokens.journeyApplicationToken = result.journeyApplicationToken ?? ""
            return try await getStatusJourney()
        }
    }

    internal mutating func checkStatusJourney(onFinish: @escaping (FinishJourneyResult?) -> Void) async throws {
        let result = try await getStatusJourney()
        if result.resultCode == .RESULT_OK {
            let urlPlugin = PluginURLBuilder(
                apiKey: AlloyCodelessLiteiOS.shared.alloySettings.apiKey ?? "",
                journeyToken: journeySettings.journeyToken,
                applicationToken: TokenHolder.tokens.journeyApplicationToken,
                entityToken: AlloyCodelessLiteiOS.shared.alloySettings.entityToken ?? "",
                isSingleEntity: AlloyCodelessLiteiOS.shared.alloySettings.isSingleEntity ?? false,
                production: journeySettings.production,
                showHeader:  AlloyCodelessLiteiOS.shared.alloySettings.showHeader ?? true,
                appUrl: AlloyCodelessLiteiOS.shared.alloySettings.appUrl,
                customTheme:  AlloyCodelessLiteiOS.shared.alloySettings.customTheme,
                componentOverride: AlloyCodelessLiteiOS.shared.alloySettings.componentOverride
            )

            guard let topVC = await UIUtils.topMostController() else { return }

            await UIUtils.presentView(viewController: WebViewController(url: urlPlugin.getPluginURL(), onFinish: onFinish, presenter: topVC), presentationStyle: .overFullScreen)
        }
    }

    @MainActor
    internal func getStatusJourney() async throws -> StartJourneyResult {
        let result = try await JourneyEndpoint
            .getStatusJourney(settings: AlloyCodelessLiteiOS.shared.alloySettings, journeySettings: journeySettings)
            .request(type: JourneyDataResponse.self)

        if result.statusCodeError != nil {
            return StartJourneyResult(resultCode: StartJourneyResultErrorCode.RESULT_ERROR, resultMessage: result.journeyError?.messageError ?? "")
        } else {
            return StartJourneyResult(resultCode: StartJourneyResultErrorCode.RESULT_OK, resultMessage: "Journey status retrieved successfully.", journeyResultData: result)
        }
    }

    internal func getJourneyData() async throws -> JourneyDataResponse? {
        let result = try await getStatusJourney()
        return result.journeyResultData
    }
}
