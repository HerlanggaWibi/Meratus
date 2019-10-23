//
//  ScheduleListCell.swift
//  Meratus
//
//  Created by MTMAC18 on 18/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit

class ScheduleListCell: UICollectionViewCell {
    
    @IBOutlet weak var etb_pol: UILabel!
    
    @IBOutlet weak var etd: UILabel!
    
    @IBOutlet weak var eta: UILabel!
    
    @IBOutlet weak var closingCargo: UILabel!
    
    @IBOutlet weak var route: UILabel!
    
    @IBOutlet weak var titleList: UILabel!
    
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var btnCopy: UIButton!
    
    @IBOutlet weak var btnBookNow: UIButton!
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.cornerRadius = 5.0
    }
    
    
    //Direct Add Shadow to cell
}


extension UIButton {
    func borderBtn() {
        self.layer.masksToBounds = false
        //self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
    }
    
    func roundedBtn(corner: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = corner
    }
}
