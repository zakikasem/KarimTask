//
//  LoginOneViewModel.swift
//  KarimTask
//
//  Created by macintosh on 19/04/2022.
//

import Foundation
import UIKit

class LoginOneViewModel : NSObject {
    var user : LoginOneResponse?
    private var apiDataSource : LoginOneDataSource!
        var showLoadingIndic : ((_ loadingIndic : Bool) -> Void)?
    var wrongCredv : ((_ wrongCred : Bool) -> Void )?
    var onLoginFailed: ((_ message: String) -> Void)?
    var OnLoginSucsess : ((_ Details : LoginOneResponse?) -> Void)?
    var showAlert : ((_ showAlert : String) -> Void)?


  
    
    override init() {
        super.init()
        self.apiDataSource = LoginOneDataSource()
    }
    
   

    
    func loginOne( mobile : String , password : String  ){
        showLoadingIndic?(true)
        apiDataSource.login(mobile: mobile  , password: password , isSucess: {
            [weak self] user in
            guard let response = user else {return}
            self?.showLoadingIndic?(false)
            
            if user?.status == true {
                self?.showAlert?(user?.message ?? "")
                self?.OnLoginSucsess?(response)
            }
            else if  user?.status == false {
                self?.showAlert?(user?.message ?? "")


            }
            
        },
        isError: { [weak self] message in
            self?.onLoginFailed?(message)

        })
    }
}
