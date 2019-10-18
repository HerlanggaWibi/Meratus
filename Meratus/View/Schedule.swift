//
//  Schedule.swift
//  Meratus
//
//  Created by MTMAC18 on 11/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import TinyConstraints

class Schedule: UIViewController {
    
    let pickerDataLoading = ["AMBON","BALIKPAPAN", "BANJARMASIN", "BELAWAN", "BENETE", "BENGKULU", "BENOA", "BITUNG", "CALABAI", "DILI"]
    let pickerDataDischarge = ["AMBON","BALIKPAPAN", "BANJARMASIN", "BELAWAN", "BENETE", "BENGKULU", "BENOA", "BITUNG", "CALABAI", "DILI"]
    let pickerDataRecord = ["3","4","5"]
    
    @IBOutlet weak var imgBanner: UIImageView!
    
    var viewModel = ScheduleViewModel(scheduleServices1: ScheduleServices())
    
    var rsgnFirstRespon: Int?
    
    lazy var datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    lazy var dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    lazy var PortOfLoadingPickerView: UIPickerView = {
       let pickerView = UIPickerView()
        
        return pickerView
    }()
    
    lazy var PortOfLoadingPickerView1: UIPickerView = {
        let pickerView = UIPickerView()
        
        return pickerView
    }()
    
    lazy var PortOfLoadingPickerView2: UIPickerView = {
        let pickerView = UIPickerView()
        
        return pickerView
    }()
    
    lazy var form: UIView = {
        let form = UIView(frame: CGRect(x: 20, y: 277, width: 374, height: 411))
        form.backgroundColor = .white
        return form
    }()
    
    lazy var imgSchedule: UIImageView = {
        let imgSchedule = UIImageView()
        imgSchedule.frame = CGRect(x: 4, y: 4, width: 30, height: 30)
        imgSchedule.image = UIImage(named: "ic_vessel")
        
        return imgSchedule
    }()
    
    lazy var lblSchedule: UILabel = {
        let lblSchedule = UILabel()
        lblSchedule.frame = CGRect(x: 50, y: 4, width: 100, height: 30)
        lblSchedule.text = "Schedule"
        lblSchedule.font = UIFont(name: "Chalkboard SE Bold", size: 17)
        lblSchedule.textColor = UIColor(red:0.02, green:0.23, blue:0.48, alpha:1.0)
        return lblSchedule
    }()
    
    lazy var shipmentDate: SkyFloatingLabelTextFieldWithIcon = {
        
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Copperplate", size: 15)
        userName.titleFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholderFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholder = ""
        userName.title = "Shipment Date"
        userName.tintColor = overcastBlueColor
        userName.selectedTitleColor = overcastBlueColor
        userName.selectedLineColor = overcastBlueColor
        
        let image = UIImage.fontAwesomeIcon(name: .calendarAlt, style: .solid, textColor: overcastBlueColor, size: CGSize(width: 50, height: 50))
        
        userName.iconImage = image
        
        return userName
    }()
    
    lazy var portOfLoading: SkyFloatingLabelTextFieldWithIcon = {
        
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Copperplate", size: 15)
        userName.titleFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholderFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholder = "Port Of Loading"
        userName.title = "Port Of Loading"
        userName.tintColor = overcastBlueColor
        userName.selectedTitleColor = overcastBlueColor
        userName.selectedLineColor = overcastBlueColor
        
        let image = UIImage.fontAwesomeIcon(name: .truckLoading, style: .solid, textColor: overcastBlueColor, size: CGSize(width: 50, height: 50))
        
        userName.iconImage = image
        
        return userName
    }()
    
    lazy var portOfDischarge: SkyFloatingLabelTextFieldWithIcon = {
        
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Copperplate", size: 15)
        userName.titleFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholderFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholder = "Port Of Discharge"
        userName.title = "Port Of Discharge"
        userName.tintColor = overcastBlueColor
        userName.selectedTitleColor = overcastBlueColor
        userName.selectedLineColor = overcastBlueColor
        
        let image = UIImage.fontAwesomeIcon(name: .truckLoading, style: .solid, textColor: overcastBlueColor, size: CGSize(width: 50, height: 50))
        
        userName.iconImage = image
        
        return userName
    }()
    
    lazy var numberOfRecord: SkyFloatingLabelTextFieldWithIcon = {
        
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Copperplate", size: 15)
        userName.titleFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholderFont = UIFont(name: "Copperplate", size: 15)!
        userName.placeholder = "Number of Records"
        userName.title = "Number of Records"
        userName.tintColor = overcastBlueColor
        userName.selectedTitleColor = overcastBlueColor
        userName.selectedLineColor = overcastBlueColor
        
        let image = UIImage.fontAwesomeIcon(name: .list, style: .solid, textColor: overcastBlueColor, size: CGSize(width: 50, height: 50))
        
        userName.iconImage = image
        
        return userName
    }()
    
    lazy var searchBtn: UIButton = {
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("SEARCH", for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "Copperplate", size: 15)
        loginBtn.backgroundColor = UIColor(red:0.02, green:0.23, blue:0.48, alpha:1.0)
        loginBtn.addTarget(self, action: #selector(scheduleList), for: .touchUpInside)
        return loginBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavbar()
        setupView()
        setupConstraints()
        PortOfLoadingPickerView.delegate = self
        PortOfLoadingPickerView1.delegate = self
        PortOfLoadingPickerView2.delegate = self
        
        shipmentDate.inputView = datePicker
        portOfLoading.inputView = PortOfLoadingPickerView
        portOfDischarge.inputView = PortOfLoadingPickerView
        numberOfRecord.inputView = PortOfLoadingPickerView
        
        getList()
    }
    
    func setupView() {
        view.addSubview(form)
        view.addSubview(lblSchedule)
        view.addSubview(imgSchedule)
        view.addSubview(shipmentDate)
        view.addSubview(portOfLoading)
        view.addSubview(portOfDischarge)
        view.addSubview(numberOfRecord)
        view.addSubview(searchBtn)
        //view.addSubview(imgSchedule)
    }
    
    func setupConstraints() {
        // FORM
        form.topToBottom(of: imgBanner, offset: 10, isActive: true)
        form.leftToSuperview(offset: 20, isActive: true)
        form.rightToSuperview(offset: -20, isActive: true)
        form.bottomToSuperview()
        form.height(500)
        
        // IMG SCHEDULE
        imgSchedule.left(to: form, offset: 10, isActive: true)
        imgSchedule.top(to: form, offset: 10, isActive: true)
        imgSchedule.height(50)
        imgSchedule.width(50)
        
        // LABEL SCHEDULE
        lblSchedule.leftToRight(of: imgSchedule, offset: 20, isActive: true)
        lblSchedule.right(to: form)
        lblSchedule.top(to: form, offset: 10, isActive: true)
        lblSchedule.height(50)
        
        // TextField shipmentDate
        shipmentDate.topToBottom(of: lblSchedule, offset: 20, isActive: true)
        shipmentDate.left(to: form, offset: 10, isActive: true)
        shipmentDate.right(to: form, offset: -10, isActive: true)
        shipmentDate.height(50)
        
        // TextField PortofLoading
        portOfLoading.topToBottom(of: shipmentDate, offset: 10, isActive: true)
        portOfLoading.left(to: form, offset: 10, isActive: true)
        portOfLoading.right(to: form, offset: -10, isActive: true)
        portOfLoading.height(50)
        
        // TextField PortofDischarge
        portOfDischarge.topToBottom(of: portOfLoading, offset: 10, isActive: true)
        portOfDischarge.left(to: form, offset: 10, isActive: true)
        portOfDischarge.right(to: form, offset: -10, isActive: true)
        portOfDischarge.height(50)
        
        // TextField NumberofRecords
        numberOfRecord.topToBottom(of: portOfDischarge, offset: 10, isActive: true)
        numberOfRecord.left(to: form, offset: 10, isActive: true)
        numberOfRecord.right(to: form, offset: -10, isActive: true)
        numberOfRecord.height(50)
        
        // Button Search
        searchBtn.topToBottom(of: numberOfRecord, offset: 10, isActive: true)
        searchBtn.left(to: form, offset: 10, isActive: true)
        searchBtn.right(to: form, offset: -10, isActive: true)
        searchBtn.height(30)
    }
    
    
    func setupNavbar() {
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        let image = UIImage(named: "edit_meratus")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
    }
    
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        shipmentDate.text = dateFormatter.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @objc func scheduleList() {
        //performSegue(withIdentifier: "ScheduleList", sender: self)
        
    }
    
    func getList() {
        viewModel.getList()
    }
    
}

extension Schedule: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
//        if rsgnFirstRespon == 1 {
//            return pickerDataLoading.count
//        }
//        else if rsgnFirstRespon == 2 {
//            return pickerDataDischarge.count
//        }
//        else if rsgnFirstRespon == 3 {
//            return pickerDataRecord.count
//        }
        if portOfLoading.isFirstResponder {
            rsgnFirstRespon = 1
            return viewModel.piname.count
        }
        else if portOfDischarge.isFirstResponder {
            rsgnFirstRespon =  2
            return viewModel.piname.count
        }
        else if numberOfRecord.isFirstResponder {
            rsgnFirstRespon =  3
            return pickerDataRecord.count
        }
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if portOfLoading.isFirstResponder {
            rsgnFirstRespon = 1
            portOfLoading.text = viewModel.piname[row]
        }
        else if portOfDischarge.isFirstResponder {
            rsgnFirstRespon =  2
            portOfDischarge.text = viewModel.piname[row]
        }
        else if numberOfRecord.isFirstResponder {
            rsgnFirstRespon =  3
            numberOfRecord.text = pickerDataRecord[row]
        }
//        if rsgnFirstRespon == 1 {
//            portOfLoading.text = pickerDataLoading[row]
//        }
//        else if rsgnFirstRespon == 2 {
//            portOfDischarge.text = pickerDataDischarge[row]
//        }
//        else if rsgnFirstRespon == 3 {
//            numberOfRecord.text = (pickerDataRecord[row])
//        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if portOfLoading.isFirstResponder {
            //rsgnFirstRespon = 1
            return viewModel.piname[row]
        }
        else if portOfDischarge.isFirstResponder {
            //rsgnFirstRespon =  2
            return viewModel.piname[row]
        }
        else if numberOfRecord.isFirstResponder {
            //rsgnFirstRespon =  3
            return pickerDataRecord[row]
        }
        return nil
        
        }
}

