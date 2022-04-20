//
//  LoginOneModel.swift
//  KarimTask
//
//  Created by macintosh on 19/04/2022.
//

import Foundation

struct LoginOneResponse : Codable {
    let status : Bool?
    let message : String?
    let data : LoginDet?
}

struct LoginDet : Codable {
    let id : Int?
    let name : String?
    let city_id : Int?
    let email : String?
    let country_code : String?
    let phone : Int?
    let status : Int?
    let address : String?
    let subscriber_id : Int?
    let photo : String?
    let updated_at : String?
    let token : String?
    let typ : String?
    let profile_link : String?
}
