//
//  HomeViewModel.swift
//  Meratus
//
//  Created by MTMAC18 on 25/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    private var homeServices: HomeServices?
    
    init(HomeServices: HomeServices) {
        self.homeServices = HomeServices
    }
    
    var linkBanner = [String]()
    
    var imgBanner: [SlideShow?]? {
        didSet {
            for list in imgBanner! {
                linkBanner.append(list!.url)
            }
            didFinish?()
        }
    }
    
    var didFinish: (() -> ())?
    
    func getBanner() {
        homeServices?.requestBanner(completion: { (response, error) in
            
            self.imgBanner = response
            
        })
    }
    
}
