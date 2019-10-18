//
//  RemotePelabuhan.swift
//  Meratus
//
//  Created by MTMAC18 on 18/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation

struct RemotePelabuhan: Codable {
    let picode, piname: String
    
    enum CodingKeys: String, CodingKey {
        case picode = "PICODE"
        case piname = "PINAME"
    }
}
