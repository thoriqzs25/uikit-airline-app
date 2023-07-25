//
//  APICaller.swift
//  Airline App
//
//  Created by Thariq Zhafran Satyagraha on 25/07/23.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    private init() {}

    enum Constants {
        static let baseAPIURL = "https://api.spotify.com/v1"
    }

    // Enum: API Errors
    enum APIError: Error {
        case failedToGetData
    }

    enum HTTPMethod: String {
        case GET
        case POST
        case DELETE
        case PUT
    }

    private func createRequest(with url: URL?,
                               type: HTTPMethod,
                               completion: @escaping (URLRequest) -> Void)
    {
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else {
                return
            }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)",
                             forHTTPHeaderField: "Authorization")
            // set HTTP Method from the enum
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            // Call the completion handler with request
            completion(request)
        }
    }
}
