//
//  HomeServices.swift
//  Meratus
//
//  Created by MTMAC18 on 25/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation
import Alamofire

struct HomeServices {
    
    
    func requestBanner(completion: @escaping ([SlideShow?], Error?) -> ()) {
        
        let url = URL(string: "http://api.meratusline.com:8888/RemoteAPIGetSliderFiles.ashx")
        let data = "[{\"TOKEN\":\"xxx\"}]"
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get.rawValue
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
                        let result = try decoder.decode([SlideShow].self, from: json)
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
