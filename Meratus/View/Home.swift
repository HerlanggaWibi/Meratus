//
//  ViewController.swift
//  Meratus
//
//  Created by MTMAC18 on 10/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var schedule: UIButton!
    @IBOutlet weak var tracking: UIButton!
    @IBOutlet weak var booking: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupButtonView()
        setupNavbar()
    }
    
    func setupButtonView() {
        schedule.setHomeViewButton()
        tracking.setHomeViewButton()
        booking.setHomeViewButton()
        
        
    }
    
    func setupNavbar() {
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        let image = UIImage(named: "edit_meratus")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
    }

}


extension UIButton {
    
    func setHomeViewButton() {
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        
    }
    
}
