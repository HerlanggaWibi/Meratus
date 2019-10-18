//
//  Account.swift
//  Meratus
//
//  Created by MTMAC18 on 15/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit

class Account: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var location: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavbar()
    }
    
    let userDefault = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let token = userDefault.string(forKey: "token")
        if token != nil {
            let getNama = userDefault.string(forKey: "uname")
            let getEmail = userDefault.string(forKey: "email")
            let getCompany = userDefault.string(forKey: "custname")
            let getLocation = userDefault.string(forKey: "lokasi")
            
            nameLbl.text = getNama
            name.text = getNama
            email.text = getEmail
            company.text = getCompany
            location.text = getLocation
        }
        else {
        performSegue(withIdentifier: "login", sender: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setupNavbar() {
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        let image = UIImage(named: "edit_meratus")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
    }
    
    @IBAction func deleteToken() {
        userDefault.removeObject(forKey: "token")
        performSegue(withIdentifier: "login", sender: self)
    }

}
