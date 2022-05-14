//
//  UserService.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/15.
//

import Foundation
import Alamofire

class UserService{
    static let shared = UserService()
    private init() {}
   
    //MARK: - Request Methods
    func signup(name:String, email: String, password : String, completion : @escaping (NetworkResult<Any>) -> Void){
        let url = APIConstants.signUpURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body : Parameters = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData {response in
            switch response.result{
            case .success:
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                let networkResult = self.judgeStatus(what : "signup", by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func login(name:String, email: String, password : String, completion : @escaping (NetworkResult<Any>) -> Void){
        let url = APIConstants.loginURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body : Parameters = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData {response in
            switch response.result{
            case .success:
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                let networkResult = self.judgeStatus(what : "login", by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    // MARK: - judgeStatus Method
    private func judgeStatus(what request : String, by statusCode : Int, _ data : Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        
        if request == "signup" {
            guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data)
            else {return .pathErr}
            
            switch statusCode{
            case 200...201: return .success(decodedData as Any)
            case 400...409: return .requestErr(decodedData.message)
            case 500: return .serverErr
            default : return .networkFail
            }
        }
        else if request == "login"{
                guard let decodedData = try? decoder.decode(LoginResponse.self, from: data)
                else {return .pathErr}
                
                switch statusCode{
                case 200...201: return .success(decodedData as Any)
                case 400...410: return .requestErr(decodedData.message)
                case 500: return .serverErr
                default : return .networkFail
            }
        }
        
        return .networkFail
        
    }
}
    
   
