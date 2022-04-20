//
//  LoginOneDataSource.swift
//  KarimTask
//
//  Created by macintosh on 19/04/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginOneDataSource {
    
    
    func login (mobile : String , password : String , isSucess : @escaping(LoginOneResponse?) -> Void , isError : @escaping (String) -> Void ){
        
        let loginRequest = AuthenticationRouter.login(mobile : mobile, password: password)
        
        AF.request(loginRequest).responseDecodable { (response: DataResponse<LoginOneResponse, AFError>) in
            switch response.result {
            case let .success(data):
                isSucess(data)
                
            case let .failure(error):
                isError("UnknownError")
            }
        }
    
    }
}
