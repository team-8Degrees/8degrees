//
//  APIRouter.swift
//  8degrees
//
//  Created by 김재민 on 2022/07/29.
//

import Foundation
import Alamofire

enum APIRouter {
    case getBoxOffice
    case getSingleBoxOffice(id: String)
}

extension APIRouter: URLRequestConvertible {
    
    var baseURL: URL {
        return URL(string: "http://172.30.1.15:8080")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getBoxOffice:
            return .get
        case .getSingleBoxOffice:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getBoxOffice:
            return "/top10BoxOffice"
        case .getSingleBoxOffice(let id):
            return "/performance/\(id)"
        }
    }
    
    var header: HTTPHeader? {
        /// todo ::  User-Agent iOS
        return nil
    }
    
    var parameters: Parameters? {
        switch self {
        case .getBoxOffice:
            return nil
        case .getSingleBoxOffice:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod  = method.rawValue
        urlRequest.allHTTPHeaderFields = nil
        
        let encoding = URLEncoding.default
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
