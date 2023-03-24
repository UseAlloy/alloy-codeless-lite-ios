
import Foundation
import SwiftUI
import UIKit

public class AlloyCodelessLiteiOS: ObservableObject {

        // MARK: - Properties
    var alloySettings = AlloySettings()
    var journeyService = JourneyService()

    public static var shared: AlloyCodelessLiteiOS = {
        let instance = AlloyCodelessLiteiOS()
        return instance
    }()

    public func authInit(alloySettings: AlloySettings) async throws -> AuthInitResult {
        do {
            self.alloySettings = alloySettings

            let result = try await AuthEndpoint
                .initialization(settings: alloySettings)
                .request(type: AuthInitResponse.self)

            if result.accessToken.isEmpty {
                return AuthInitResult(AuthInitResultErrorCode.RESULT_ERROR, Utils.NSLocalizedString("start_journey_error"))
            }

            TokenHolder.tokens.accessToken = result.accessToken
            return AuthInitResult(AuthInitResultErrorCode.RESULT_OK, "OK")
        } catch {
            return AuthInitResult(AuthInitResultErrorCode.RESULT_ERROR, error.localizedDescription)
        }
    }

    public func startJourney(journeySettings: JourneySettings, onFinish: @escaping (FinishJourneyResult?) -> Void) async throws -> StartJourneyResult? {
        try await journeyService.startJourney(journeySettings: journeySettings, onFinish: onFinish)
    }

    public func checkStatusJourney(onFinish: @escaping (FinishJourneyResult?) -> Void ) async throws {
        try await journeyService.checkStatusJourney(onFinish: onFinish)
    }

    public func getJourneyData() async throws -> JourneyDataResponse? {
        try await journeyService.getJourneyData()
    }
}

