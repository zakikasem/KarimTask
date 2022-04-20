//
//  AuthenticationRouter.swift
//  KarimTask
//
//  Created by macintosh on 19/04/2022.
//

import Foundation
import Alamofire


enum AuthenticationRouter : URLRequestConvertible {
  
    case login (mobile :String , password : String )
    
    
    var url: URL {
        switch self {
        case .login:
            return URL(string:"https://www.d2020.net/last_version/api/owner/login")!
            
        }
    }
    
    var parameters: [String:Any]? {
        switch self {
        case .login(let mobile , let password ):
            return ["mobile": mobile , "password": password ]
       }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        
        let headers : HTTPHeaders? = {
            
            switch self{
            
            case .login:
                return nil
           
                
            }
            
        
        }()
        
        
        
        let method: HTTPMethod = {
            switch self {
            case .login :
                return .post
                
           
            }
        }()
        
        var urlRequest = try! URLRequest(url: url, method: method, headers: headers)
        var encoding: ParameterEncoding
        
        // TODO:
        switch self {

            
        default:
            encoding = JSONEncoding.default
            urlRequest = try encoding.encode(urlRequest , with : parameters)
        }
        
        return urlRequest
    }
}
    

