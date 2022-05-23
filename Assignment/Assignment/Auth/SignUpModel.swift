//
//  SignUpModel.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/15.
//

import Foundation

struct SignUpResponse : Codable{
    let status : Int
    let success : Bool
    let message : String
    let data : SignUpData?
}

struct SignUpData : Codable{
    let id : Int
}


