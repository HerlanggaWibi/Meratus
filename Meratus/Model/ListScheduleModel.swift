//
//  ListScheduleModel.swift
//  Meratus
//
//  Created by MTMAC18 on 18/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation
struct ListScheduleModel: Codable {
    let uname, groupNo, rute, etdPol: String
    let etaPod, etdEta, terminal, etdPol1: String
    let etaPod1, polCode, podCode, rute1: String
    let vslgnm1, etd1, etaLast, opendt: String
    let closedt, voyage1, vessel1, enAble: String
    let btncaption, etbpoldtterm, etbpoddtterm: String
    let details: [Detail]
    
    enum CodingKeys: String, CodingKey {
        case uname = "UNAME"
        case groupNo = "GROUP_NO"
        case rute = "RUTE"
        case etdPol = "ETD_POL"
        case etaPod = "ETA_POD"
        case etdEta = "ETD_ETA"
        case terminal = "TERMINAL"
        case etdPol1 = "ETD_POL1"
        case etaPod1 = "ETA_POD1"
        case polCode = "POL_CODE"
        case podCode = "POD_CODE"
        case rute1 = "RUTE1"
        case vslgnm1 = "VSLGNM1"
        case etd1 = "ETD1"
        case etaLast = "ETA_LAST"
        case opendt = "OPENDT"
        case closedt = "CLOSEDT"
        case voyage1 = "VOYAGE1"
        case vessel1 = "VESSEL1"
        case enAble = "EN_ABLE"
        case btncaption = "BTNCAPTION"
        case etbpoldtterm = "ETBPOLDTTERM"
        case etbpoddtterm = "ETBPODDTTERM"
        case details = "DETAILS"
    }
}

// MARK: - Detail
struct Detail: Codable {
    let rute, vslgnm, etdPol1, etaPod1: String
    let voyage, vessel, etdPol, etaPod: String
    let uname, groupNo, pol, pod: String
    
    enum CodingKeys: String, CodingKey {
        case rute = "RUTE"
        case vslgnm = "VSLGNM"
        case etdPol1 = "ETD_POL1"
        case etaPod1 = "ETA_POD1"
        case voyage = "VOYAGE"
        case vessel = "VESSEL"
        case etdPol = "ETD_POL"
        case etaPod = "ETA_POD"
        case uname = "UNAME"
        case groupNo = "GROUP_NO"
        case pol = "POL"
        case pod = "POD"
    }
}
