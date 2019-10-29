//
//  Account.swift
//  Meratus
//
//  Created by MTMAC18 on 15/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Account: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var profile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureButtonBar()
        // Do any additional setup after loading the view.
        
        btnCheckBox.setImage(UIImage(named:"Checkmarkempty"), for: .normal)
        btnCheckBox.setImage(UIImage(named:"Checkmark"), for: .selected)
        setupNavbar()
        setProfil()
    }
    
//    func configureButtonBar() {
//        settings.style.buttonBarBackgroundColor = .white
//        settings.style.buttonBarItemBackgroundColor = .white
//        
//        settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 16.0)!
//        settings.style.buttonBarItemTitleColor = .gray
//        
//        settings.style.buttonBarMinimumLineSpacing = 0
//        settings.style.buttonBarItemsShouldFillAvailableWidth = true
//        settings.style.buttonBarLeftContentInset = 0
//        settings.style.buttonBarRightContentInset = 0
//        
//        settings.style.selectedBarHeight = 3.0
//        settings.style.selectedBarBackgroundColor = UIColor(red:0.15, green:0.68, blue:0.38, alpha:1.0)
//        
//        // Changing item text color on swipe
//        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
//            guard changeCurrentIndex == true else { return }
//            oldCell?.label.textColor = .gray
//            newCell?.label.textColor = .orange
//        }
//    }
    
//    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        let child1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Contoh1") as! Contoh1
//
//        let child2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Contoh2") as! Contoh2
//
//        return [child1, child2]
//    }
    
    
    @IBAction func tapUploadProfile(_ sender: UITapGestureRecognizer) {
        actionSheet()
    }
    
    
    func actionSheet() {
        let alert = UIAlertController(title: "Upload Profile", message: "", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Capture with Camera", style: .default) { (action) in
            print("camera")
        }
        
        let library = UIAlertAction(title: "Pick from Gallery", style: .default) { (action) in
            print("Library")
            self.openLibrary()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(camera)
        alert.addAction(library)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profile.image = chosenImage
        
        dismiss(animated: true, completion: nil)
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
    
    func setProfil() {
        profile.layer.masksToBounds = false
        profile.layer.cornerRadius = 20
    }
    
    @IBAction func deleteToken() {
        userDefault.removeObject(forKey: "token")
        performSegue(withIdentifier: "login", sender: self)
    }
    
    @IBAction func checkMarkTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }) { (success) in
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    @IBAction func changePhone(_ sender: UIButton) {
        let alert = UIAlertController(title: "Change Phone Number", message: "Input new Phone Number", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Input..."
            
        }
        let yes = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            print("yes")
        }
        
        let no = UIAlertAction(title: "Save", style: .default) { (action) in
            print("yes")
        }
        
        alert.addAction(no)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changePin(_ sender: UIButton) {
        let alert = UIAlertController(title: "Change PIN", message: "Input new PIN", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Input old PIN"
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Input new PIN"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "New PIN Confirmation"
        }
        
        let yes = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            print("yes")
        }
        
        let no = UIAlertAction(title: "Change PIN", style: .default) { (action) in
            print("yes")
        }
        
        alert.addAction(no)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }

}
