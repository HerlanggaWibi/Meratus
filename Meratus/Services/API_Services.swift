//
//  API_Services.swift
//  Meratus
//
//  Created by MTMAC18 on 14/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

struct API_Services {
    
    let userDefault = UserDefaults.standard
    
    // Singleton
    static let shared = API_Services()
    
    func requestFetchData(username: String, password: String, sessionId: String, completion: @escaping ([LoginModel?], Error?) -> ()) {
        
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
                let fixValue = data.dropFirst().dropLast()

                do{
                    
                    let decoder = JSONDecoder()
                    if let json = fixValue.data(using: String.Encoding.utf8) {
                    let result = try decoder.decode([LoginModel].self, from: json)
                    completion(result, nil)
                    return
                        
                    }
                }
                catch {
                    print("error tangkap data")
                    print(error.localizedDescription)
                    
                }
        }
    }
}
    

}
