//
//  AuthEndpoint.swift
//  Alloy Codeless SDK
//
//

import Foundation

internal enum AuthEndpoint {
    case initialization(settings: AlloySettings)
}

extension AuthEndpoint: Endpoint {
    
    var baseURLString: String {

        switch self {
        case .initialization(let settings):
            return URLs.getApi(settings)
        }
    }
    
    var path: String {
        "/auth/init"
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
            case .initialization(let settings):
                return [ URLQueryItem(name: "production", value: "\(settings.production)") ]
        }
    }
    
    var method: HTTPMethod {
        
        .post
        
    }
    
    var headers: HTTPHeaders? {
        return HTTPHeaders()
    }
    
    var parameters: [String : Any]? {
        
        switch self {
        case .initialization(let settings):
            return ["id": settings.apiKey ?? "", "journey_token": settings.journeyToken ?? "", "journey_application_token": settings.journeyApplicationToken ?? ""]
        }
    }
    
    var body: Data? {
        nil
    }
    
    var parameterEncoding: ParameterEncoding {
        .JSONEncoding
    }
    
    var showDebugInfo: Bool {
        
        switch self {
            case .initialization(let settings):
            return settings.showDebugInfo
        }
        
    }
    
}
