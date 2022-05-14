//
//  APIConstants.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/15.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: = Feature URL
    static let signUpURL = baseURL + "/auth/signup"
    static let loginURL = baseURL + "/auth/signin"
}
