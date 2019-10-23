//
//  Login.swift
//  Meratus
//
//  Created by MTMAC18 on 14/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit
import TinyConstraints
import SkyFloatingLabelTextField
import FontAwesome_swift
import Alamofire
import SwiftyJSON

class Login: UIViewController {
    
    @IBOutlet weak var welcomeBack: UILabel!
    
    var viewModel = LoginViewModel(APIServices: API_Services())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        customView()
    }
    
    let userDefault = UserDefaults.standard
    
    @IBAction func back() {
        performSegue(withIdentifier: "Home", sender: self)
    }
    
    lazy var userName: SkyFloatingLabelTextFieldWithIcon = {
        
        let overcastBlueColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        //userName.titleFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholderFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        userName.placeholder = "Input Username"
        userName.title = "Username"
        userName.tintColor = overcastBlueColor
        userName.selectedTitleColor = overcastBlueColor
        userName.selectedLineColor = overcastBlueColor
        
        let image = UIImage.fontAwesomeIcon(name: .user, style: .solid, textColor: overcastBlueColor, size: CGSize(width: 50, height: 50))
        
        userName.iconImage = image
        
        return userName
    }()
    
    lazy var passWord: SkyFloatingLabelTextFieldWithIcon = {
        
        let overcastBlueColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let passWord = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        passWord.isSecureTextEntry = true
        passWord.iconFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        //passWord.titleFont = UIFont(name: "Copperplate", size: 15)!
        passWord.placeholderFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        passWord.placeholder = "Input Password"
        passWord.title = "Password"
        passWord.tintColor = overcastBlueColor
        passWord.selectedTitleColor = overcastBlueColor
        passWord.selectedLineColor = overcastBlueColor
        
        let image = UIImage.fontAwesomeIcon(name: .unlock, style: .solid, textColor: overcastBlueColor, size: CGSize(width: 50, height: 50))
        passWord.iconImage = image
        return passWord
    }()
    
    
    lazy var loginBtn: UIButton = {
       let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("LOGIN", for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "Chalkboard SE Bold", size: 17)
        loginBtn.backgroundColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        return loginBtn
    }()
    
    lazy var forgetPasswordBtn: UIButton = {
        let forgetPasswordBtn = UIButton(type: .custom)
        forgetPasswordBtn.setTitle("Forget Password?", for: .normal)
        forgetPasswordBtn.setTitleColor(UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0), for: .normal)
        forgetPasswordBtn.addTarget(self, action: #selector(forgetPassword), for: .touchUpInside)
        return forgetPasswordBtn
    }()
    
    lazy var indicatorLogin: UIActivityIndicatorView = {
        let indicatorLogin = UIActivityIndicatorView()
        return indicatorLogin
    }()
    
    @objc func login() {
        indicatorLogin.startAnimating()
        viewModel.login(uname: userName.text!, pwd: passWord.text!, sessionID: "123")
        
        viewModel.didFinishLogin = {
            self.indicatorLogin.stopAnimating()
            
            self.performSegue(withIdentifier: "Home", sender: self)
            
        }
        
    }
    
    @objc func forgetPassword() {
        print("Forget Password")
    }
    
    
    fileprivate func setupView() {
        
        view.addSubview(userName)
        userName.topToBottom(of: welcomeBack, offset: 50, relation: .equal, isActive: true)
        userName.rightToSuperview(offset: -25, usingSafeArea: true)
        userName.leftToSuperview(offset: 25, usingSafeArea: true)
        userName.height(40)
        
        view.addSubview(passWord)
        passWord.topToBottom(of: userName, offset: 20, relation: .equal, isActive: true)
        passWord.rightToSuperview(offset: -25, usingSafeArea: true)
        passWord.leftToSuperview(offset: 25, usingSafeArea: true)
        passWord.height(40)
        
        view.addSubview(loginBtn)
        loginBtn.topToBottom(of: passWord, offset: 20, relation: .equal, isActive: true)
        loginBtn.rightToSuperview(offset: -25, usingSafeArea: true)
        loginBtn.leftToSuperview(offset: 25, usingSafeArea: true)
        loginBtn.height(40)
        
        view.addSubview(forgetPasswordBtn)
        forgetPasswordBtn.topToBottom(of: loginBtn, offset: 10, relation: .equal, isActive: true)
        forgetPasswordBtn.rightToSuperview(offset: -25, usingSafeArea: true)
        //loginBtn.leftToSuperview(offset: 25, usingSafeArea: true)
        forgetPasswordBtn.height(20)
    }
    
    func customView() {
        loginBtn.roundedBtn(corner: 5)
    }
    
    func requestFetchData(username: String, password: String, sessionId: String) {
        print("sudah sampai API_Services")
        let url = URL(string: "http://api.meratusline.com:8888/RemoteAPILoginMobile.ashx")
        let data = "[{\"UNAME\":\"\(username)\",\"PWD\":\"\(password)\",\"SESSIONID\":\"123\"}]"
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = data.data(using: .utf8)
        
        Alamofire.request(request).responseString { (response) in
            if let error = response.error {
                //completion(nil, error)
                print("sudah sampai API_Services 5")
                print("Error")
                return
            }
            if let data = response.result.value {
//                let getValue = data
//                let fixValue = data.dropLast()
//                let fixValue1 = fixValue.dropFirst()
//
//                do{
//                    let decoder = JSONDecoder()
//                    if let json = fixValue1.data(using: String.Encoding.utf8){
//                        let result = try decoder.decode([LoginModel].self, from: json)
//                        for user in result {
//                            print(user.uname)
//
//                            self.userDefault.set(user.uname, forKey: "uname")
//                            self.userDefault.set(user.token, forKey: "token")
//                            self.userDefault.set(user.email, forKey: "email")
//                            self.userDefault.set(user.custname, forKey: "custname")
//                            self.userDefault.set(user.lokasi, forKey: "lokasi")
//                            self.performSegue(withIdentifier: "akun", sender: self)
//                        }
//                    }
//                }
//                catch {
//                    print(error.localizedDescription)
//
//                }
            }
        }
    }
    
}

extension UIButton {
    func setLoginBtn() {
        
    }
}
