//
//  ConsigneeListCell.swift
//  Meratus
//
//  Created by MTMAC18 on 28/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit

class ConsigneeListCell: UITableViewCell {
    
    @IBOutlet weak var namaUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    @IBOutlet weak var noHPUser: UILabel!
    @IBOutlet weak var kotaUser: UILabel!
    
    @IBOutlet weak var editList: UIButton!
    @IBOutlet weak var deleteList: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
