//
//  LoginViewModel.swift
//  Meratus
//
//  Created by MTMAC18 on 14/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    private var APIServices: API_Services?
    
    let userDefault = UserDefaults.standard
    
    var dataLoginUser: [LoginModel?]? {
        didSet {
            //guard let data = dataLoginUser else { return }
            print("berhasil login: ")
            self.saveDataUser(dataUser: dataLoginUser!)
            self.didFinishLogin?()
        }
    }
    
    private func saveDataUser(dataUser: [LoginModel?]) {
        for user in dataUser {
            self.userDefault.set(user?.uname, forKey: "uname")
            self.userDefault.set(user?.token, forKey: "token")
            self.userDefault.set(user?.email, forKey: "email")
            self.userDefault.set(user?.custname, forKey: "custname")
            self.userDefault.set(user?.lokasi, forKey: "lokasi")
        }
    }
    
    var error: Error? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var news: String?
    
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishLogin: (() -> ())?
    
    init(APIServices: API_Services) {
        self.APIServices = APIServices
    }
    
    func login(uname: String, pwd: String, sessionID: String) {
        
        print("sudah sampai View MOdel")
        self.APIServices?.requestFetchData(username: uname, password: pwd, sessionId: sessionID, completion: { (dataLogin, error) in
            
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
                self.error = nil
                self.isLoading = false
                self.dataLoginUser = dataLogin
    
        })
    }
    
}
