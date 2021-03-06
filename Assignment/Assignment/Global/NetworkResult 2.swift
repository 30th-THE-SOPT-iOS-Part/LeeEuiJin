//
//  NetworkResult.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/15.
//

import Foundation
enum NetworkResult <T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
