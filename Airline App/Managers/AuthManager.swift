//
//  AuthManager.swift
//  Airline App
//
//  Created by Thariq Zhafran Satyagraha on 25/07/23.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    private init() {}

    var isSignedIn: Bool {
        return accessToken != nil
    }

    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }

    private var tokenExpirationDate: Date? {
        return UserDefaults.standard.object(forKey: "expirationDate") as? Date
    }

    public func withValidToken(completion: @escaping (String) -> Void) {
        if let token = accessToken {
            completion(token)
        }
    }
}
