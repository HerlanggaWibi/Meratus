//
//  SlideShow.swift
//  Meratus
//
//  Created by MTMAC18 on 25/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation
struct SlideShow: Codable {
    let filename, fileext, filedate, refresh: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case filename = "FILENAME"
        case fileext = "FILEEXT"
        case filedate = "FILEDATE"
        case refresh = "REFRESH"
        case url = "URL"
    }
}
