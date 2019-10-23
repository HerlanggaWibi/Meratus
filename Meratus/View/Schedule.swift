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

    @IBOutlet weak var imgBanner: UIImageView!
    
    var viewModel = ScheduleViewModel(scheduleServices1: ScheduleServices())
    
    private let calendar: AVCalendarViewController = AVCalendarViewController.calendar
    private var selectedDate: AVDate?
    
    var piCodeAwal: String?
    var piCodeTujuan: String?
    
    var listDataSchedule = [ListScheduleModel?]()
    
    lazy var datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
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
        pickerView.backgroundColor = .white
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
        lblSchedule.font = UIFont.boldSystemFont(ofSize: lblSchedule.font.pointSize)
        lblSchedule.textColor = UIColor(red:0.02, green:0.23, blue:0.48, alpha:1.0)
        return lblSchedule
    }()
    
    lazy var shipmentDate: SkyFloatingLabelTextFieldWithIcon = {
        
        let overcastBlueColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        //userName.titleFont = UIFont(name: "Chalkboard SE Bold", size: 17)!
        userName.placeholderFont = UIFont(name: "Chalkboard SE Bold", size: 17)
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
        
        let overcastBlueColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        //userName.titleFont = UIFont(name: "Chalkboard SE Bold", size: 17)!
        userName.placeholderFont = UIFont(name: "Chalkboard SE Bold", size: 17)
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
        
        let overcastBlueColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
        let userName = SkyFloatingLabelTextFieldWithIcon(frame: textFieldFrame, iconType: .image)
        //userName.titleFont = UIFont(name: "FontAwesome", size: 15)!
        
        userName.iconFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        //userName.titleFont = UIFont(name: "Chalkboard SE Bold", size: 17)!
        userName.placeholderFont = UIFont(name: "Chalkboard SE Bold", size: 17)
        userName.placeholder = "Port Of Discharge"
        userName.title = "Port Of Discharge"
        userName.tintColor = overcastBlueColor
        userName.selectedTitleColor = overcastBlueColor
        userName.selectedLineColor = overcastBlueColor
        
        let image = UIImage.fontAwesomeIcon(name: .truckLoading, style: .solid, textColor: overcastBlueColor, size: CGSize(width: 50, height: 50))
        
        userName.iconImage = image
        
        return userName
    }()
    
    
    lazy var searchBtn: UIButton = {
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("SEARCH", for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "Chalkboard SE Bold", size: 17)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        loginBtn.backgroundColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        loginBtn.addTarget(self, action: #selector(scheduleList), for: .touchUpInside)
        return loginBtn
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
       let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavbar()
        setupView()
        setupConstraints()
        customView()
        
        PortOfLoadingPickerView.delegate = self
        
        //shipmentDate.inputView = datePicker
        shipmentDate.delegate = self
        portOfLoading.inputView = PortOfLoadingPickerView
        portOfDischarge.inputView = PortOfLoadingPickerView
        
        
        getList()
    }
    
    func setupView() {
        view.addSubview(form)
        view.addSubview(lblSchedule)
        view.addSubview(imgSchedule)
        view.addSubview(shipmentDate)
        view.addSubview(portOfLoading)
        view.addSubview(portOfDischarge)
        view.addSubview(searchBtn)
        view.addSubview(activityIndicator)
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
        
        // Button Search
        searchBtn.topToBottom(of: portOfDischarge, offset: 30, isActive: true)
        searchBtn.left(to: form, offset: 10, isActive: true)
        searchBtn.right(to: form, offset: -10, isActive: true)
        searchBtn.height(40)
        
        // Activity Indicator
        activityIndicator.centerXToSuperview()
        activityIndicator.centerYToSuperview()
        activityIndicator.height(100)
        
    }
    
    
    func setupNavbar() {
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        let image = UIImage(named: "edit_meratus")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
    }
    
    func customView() {
        searchBtn.roundedBtn(corner: 5)
    }
    
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        shipmentDate.text = dateFormatter.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @objc func scheduleList() {
        let token = UserDefaults.standard.string(forKey: "token")
        let date = getDate()
        viewModel.getScheduleList(pol: piCodeAwal!, pod: piCodeTujuan!, fromDate: date, recnum: 5, token: token!)
        activityIndicator.startAnimating()
        viewModel.listClosure = {
            self.listDataSchedule = self.viewModel.listData
        }
        viewModel.didFinish = {
            self.performSegue(withIdentifier: "ScheduleList", sender: self)
            self.activityIndicator.stopAnimating()
            self.listDataSchedule.removeAll()
        }
        
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let string = formatter.string(from: Date())
        let edit = string.replacingOccurrences(of: "-", with: "")
        return edit
    }
    
    func getList() {
        viewModel.getList()
    }
    
    func showTheCalendar() {
        calendar.dateStyleComponents = CalendarComponentStyle(backgroundColor: UIColor(red: 89/255, green: 65/255, blue: 102/255, alpha: 1.0),
                                                              textColor: .white,
                                                              highlightColor: UIColor(red: 126/255, green: 192/255, blue: 196/255, alpha: 1.0).withAlphaComponent(0.5))
        calendar.yearStyleComponents = CalendarComponentStyle(backgroundColor: UIColor(red: 126/255, green: 192/255, blue: 196/255, alpha: 1.0),
                                                              textColor: .black, highlightColor: .white)
        calendar.monthStyleComponents = CalendarComponentStyle(backgroundColor: UIColor(red: 47/255, green: 60/255, blue: 95/255, alpha: 1.0),
                                                               textColor: UIColor(red: 126/255, green: 192/255, blue: 196/255, alpha: 1.0),
                                                               highlightColor: UIColor.white)
        
        calendar.subscriber = { [weak self] (date) in guard let checkedSelf = self else { return }
            if date != nil {
                checkedSelf.selectedDate = date
                let _ = Date(timeIntervalSince1970: TimeInterval(date?.doubleVal ?? 0))
                if let day = date?.day, let month = date?.month, let year = date?.year {
                    let dateString = day + " " + month + " " + year
                    //checkedSelf.selectDateButton.setTitle(dateString, for: .normal)
                    self?.shipmentDate.text = "\(dateString)"
                }
            }
        }
        calendar.preSelectedDate = selectedDate
        self.present(calendar, animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ScheduleList" {
            let destinationVC = segue.destination as! ListScheduleNC
            let targetController = destinationVC.topViewController as! ScheduleList
            targetController.listDataSchedule = listDataSchedule
        }
    }
    
}

extension Schedule: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if portOfLoading.isFirstResponder {
            return viewModel.piname.count
        }
        else if portOfDischarge.isFirstResponder {
            
            return viewModel.piname.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if portOfLoading.isFirstResponder {
            //rsgnFirstRespon = 1
            portOfLoading.text = viewModel.piname[row]
            piCodeAwal = viewModel.picode[row]
        }
        else if portOfDischarge.isFirstResponder {
            //rsgnFirstRespon =  2
            portOfDischarge.text = viewModel.piname[row]
            piCodeTujuan = viewModel.picode[row]
            
        }
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

        return nil
        
        }
}

extension Schedule: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        showTheCalendar()
    }
}
