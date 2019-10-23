//
//  ScheduleViewModel.swift
//  Meratus
//
//  Created by MTMAC18 on 18/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation
import Alamofire

class ScheduleViewModel {
    
    private var scheduleServices: ScheduleServices?
    
    var scheduleListVM = ScheduleListViewModel()
    
    var piname = [String]()
    var picode = [String]()
    
    
    var list: [RemotePelabuhan?]? {
        didSet {
            for kota in list! {
                piname.append(kota!.piname)
                picode.append(kota!.picode)
            }
            
        }
    }
    
    var listData = [ListScheduleModel?]()
    
    var getListSchedule: [ListScheduleModel?]? {
        didSet {
            listData.removeAll()
            for list in getListSchedule! {
                self.listData.append(list)
                
            }
            listClosure?()
            didFinish?()
        }
    }
    
    var listClosure: (() -> ())?
    var didFinish: (() -> ())?
    
    init(scheduleServices1: ScheduleServices) {
        self.scheduleServices = scheduleServices1
    }
    
    
    func getList() {
        scheduleServices?.requestSchedule(completion: { (response, error) in
            
            if let error = error {
                return
            }

            self.list = response
            
        })}
    
    func getScheduleList(pol: String, pod: String, fromDate: String, recnum: Int, token: String) {
            scheduleServices?.requestListSchedule(pol: pol, pod: pod, fromDate: fromDate, recnum: recnum, token: token, completion: { (response, error) in
                if let error = error {
                    print("error: \(error)")
                }
                print("berhasil tangkap data")
                self.getListSchedule = response
            })
        }
    
}
