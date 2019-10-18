//
//  ScheduleServices.swift
//  Meratus
//
//  Created by MTMAC18 on 18/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation
import Alamofire


struct  ScheduleServices {
    
    // singleton
    static let shared = ScheduleServices()
    
    // URL
    private var url = "http://api.meratusline.com:8888/RemotePelabuhan.ashx"
    
    // Object Decoder
    let decoder = JSONDecoder()
    
    func requestSchedule(completion: @escaping([RemotePelabuhan?], Error?) -> ()) {
        Alamofire.request(url, method: .get).responseString { (response) in
            
            if let error = response.error {
                print("error ScheduleServices: \(error)")
                return
            }
            if let value = response.result.value {
                let list = value.dropFirst().dropLast()
                let dataToObject = list.data(using: .utf8)!
                
                do {
                    let result = try self.decoder.decode([RemotePelabuhan].self, from: dataToObject)
                    completion(result, nil)
                    return
                }
                catch {
                }
                
                return
            }
        }
    }
    
    
    func requestListSchedule(pol: String, pod: String, fromDate: String, recnum: Int, token: String, completion: @escaping([ListScheduleModel?], Error?) -> ())
    {
        let url = URL(string: "http://api.meratusline.com:8888/RemoteAPIVesselScheduleSealiner.ashx")
        let data = "[{\"POL\":\"\(pol)\",\"POD\":\"\(pod)\",\"FROMDATE\":\"\(fromDate)\",\"RECNUM\":\"\(recnum)\",\"TOKEN\":\"\(token)\"}]"
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
                        let result = try decoder.decode([ListScheduleModel].self, from: json)
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
