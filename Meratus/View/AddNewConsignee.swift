//
//  AddNewConsignee.swift
//  Meratus
//
//  Created by MTMAC18 on 28/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import TinyConstraints

class AddNewConsignee: UIViewController {
    
    @IBOutlet weak var containerTextField: UIView!
    
    let biruMitrais = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
    
    lazy var companyName: SkyFloatingLabelTextField = {
       let companyName = SkyFloatingLabelTextField()
        companyName.title = "Company Name"
        companyName.placeholder = "Company Name"
        return companyName
    }()
    
    lazy var name: SkyFloatingLabelTextField = {
        let name = SkyFloatingLabelTextField()
        name.title = "Name"
        name.placeholder = "Name"
        return name
    }()
    
    lazy var email: SkyFloatingLabelTextField = {
        let name = SkyFloatingLabelTextField()
        name.title = "Email"
        name.placeholder = "Email"
        return name
    }()
    
    lazy var phone: SkyFloatingLabelTextField = {
        let name = SkyFloatingLabelTextField()
        name.title = "Phone"
        name.placeholder = "Phone"
        return name
    }()
    
    lazy var city: SkyFloatingLabelTextField = {
        let name = SkyFloatingLabelTextField()
        name.title = "City"
        name.placeholder = "City"
        return name
    }()
    
    lazy var address: SkyFloatingLabelTextField = {
        let name = SkyFloatingLabelTextField()
        name.title = "Address"
        name.placeholder = "Address"
        return name
    }()
    
    lazy var submit: UIButton = {
       let submit = UIButton()
        submit.setTitle("SUBMIT", for: .normal)
        submit.addTarget(self, action: #selector(submitBtn), for: .touchUpInside)
        submit.backgroundColor = biruMitrais
        return submit
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupConstraint()
    }
    
    
    func setupView() {
        view.addSubview(companyName)
        view.addSubview(name)
        view.addSubview(email)
        view.addSubview(phone)
        view.addSubview(city)
        view.addSubview(address)
        view.addSubview(submit)
    }
    
    func setupConstraint() {
        companyName.top(to: containerTextField, offset: 10, isActive: true)
        companyName.right(to: containerTextField, offset: -5, isActive: true)
        companyName.left(to: containerTextField, offset: 5, isActive: true)
        companyName.height(50)
        
        name.topToBottom(of: companyName, offset: 20, isActive: true)
        name.right(to: containerTextField, offset: -5, isActive: true)
        name.left(to: containerTextField, offset: 5, isActive: true)
        name.height(50)
        
        email.topToBottom(of: name, offset: 20, isActive: true)
        email.right(to: containerTextField, offset: -5, isActive: true)
        email.left(to: containerTextField, offset: 5, isActive: true)
        email.height(50)
        
        phone.topToBottom(of: email, offset: 20, isActive: true)
        phone.right(to: containerTextField, offset: -5, isActive: true)
        phone.left(to: containerTextField, offset: 5, isActive: true)
        phone.height(50)
        
        city.topToBottom(of: phone, offset: 20, isActive: true)
        city.right(to: containerTextField, offset: -5, isActive: true)
        city.left(to: containerTextField, offset: 5, isActive: true)
        city.height(50)
        
        address.topToBottom(of: city, offset: 20, isActive: true)
        address.right(to: containerTextField, offset: -5, isActive: true)
        address.left(to: containerTextField, offset: 5, isActive: true)
        address.height(50)
        
        submit.topToBottom(of: address, offset: 40, isActive: true)
        submit.right(to: containerTextField, offset: -5, isActive: true)
        submit.left(to: containerTextField, offset: 5, isActive: true)
        submit.height(50)
    }
    
    @objc func submitBtn() {
        print("submit Btn")
    }
}
