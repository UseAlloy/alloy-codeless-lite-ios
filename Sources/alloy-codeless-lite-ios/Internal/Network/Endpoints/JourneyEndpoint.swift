    //
    //  JourneyEndpoint.swift
    //  Alloy Codeless SDK
    //
    //

    import Foundation

    internal enum JourneyEndpoint {
        case createJourney(settings: AlloySettings, journeySettings: JourneySettings)
        case getStatusJourney(settings: AlloySettings, journeySettings: JourneySettings)
    }

    extension JourneyEndpoint: Endpoint {

        var baseURLString: String {
            switch self {
            case .createJourney(let settings, _), .getStatusJourney(let settings, _):
                return URLs.getApi(settings)
            }
        }

        var path: String {
            switch self {
            case .createJourney(_, let journeySettings):
                return "/v1/journeys/\(journeySettings.journeyToken)/applications"
            case .getStatusJourney(_, let journeySettings):
                return "/journeys/application/"
            }
        }

        var queryItems: [URLQueryItem]? {
            switch self {
            case .createJourney(let settings, _), .getStatusJourney(let settings, _):
                return [ .init(name: "production", value: "\(settings.production)") ]
            }
        }

        var method: HTTPMethod {
            switch self {
            case .createJourney :
                return .post
            case .getStatusJourney:
                return .get
            }
        }

        var headers: HTTPHeaders? {
            var headers = HTTPHeaders()
            headers.add(HTTPHeader.authorization(bearerToken: TokenHolder.tokens.accessToken))

            switch self {
            case .createJourney(_, let journeySettings):
                headers.add(name:"alloy-journey-override-sync", value: "true")
                headers.add(name:"alloy-sandbox", value: "\(!journeySettings.production)")
            default:
                break
            }
            return headers

        }

        var parameters: [String : Any]? {
            nil
        }

        var body: Data? {
            switch self {
            case .createJourney(_, let journeySettings):
                return try? JSONEncoder().encode(journeySettings.entities)
            default:
                return nil
            }
        }

        var parameterEncoding: ParameterEncoding {
            .noEncodingJSON
        }
        
        var showDebugInfo: Bool {
            switch self {
            case .createJourney(_, let journeySettings):
                return journeySettings.showDebugInfo
            case .getStatusJourney(_, let journeySettings):
                return journeySettings.showDebugInfo
            }
        }
    }

