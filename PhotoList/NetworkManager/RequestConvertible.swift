//
//  File.swift
//  PhotoList
//
//  Created by ket on 6/1/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation
import Alamofire

enum RequestConvertible: URLRequestConvertible {
    case getDefaultListPhotos(onPage: Int)
    case getSearchListPhotos(text: String)
    
    private static let baseURLString = "https://api.unsplash.com"
    
    // Define HTTP method.
    var method: HTTPMethod {
        switch self {
        case .getDefaultListPhotos, .getSearchListPhotos:
            return .get
        }
    }
    
    // Assembled web link.
    var path: String {
        switch self {
        case .getDefaultListPhotos(let page):
            return "/photos/?client_id=4c9fbfbbd92c17a2e95081cec370b4511659666240eb4db9416c40c641ee843b&page=\(page)&per_page=30"
        case .getSearchListPhotos(let text):
            return "/search/photos/?client_id=4c9fbfbbd92c17a2e95081cec370b4511659666240eb4db9416c40c641ee843b&query=\(text)&per_page=1"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try (RequestConvertible.baseURLString + path).asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
