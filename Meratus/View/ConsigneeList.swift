//
//  ConsigneeList.swift
//  Meratus
//
//  Created by MTMAC18 on 28/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit
import JJFloatingActionButton

class ConsigneeList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var btnPlus: JJFloatingActionButton = {
        let btnPlus = JJFloatingActionButton()
        return btnPlus
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        btnPlus.buttonColor = UIColor(red:0.00, green:0.11, blue:0.47, alpha:1.0)
        
        btnPlus.addItem(title: "Add") { item in
            self.performSegue(withIdentifier: "addNewConsignee", sender: self)
        }
        
        btnPlus.display(inViewController: self)
    }
    
    @objc func editList(_ sender: UIButton) {
        let tag = sender.tag
        print("tag: \(tag)")
    }

}

extension ConsigneeList: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConsigneeListCell
        
        cell.namaUser.text = "Ardy Setiawan"
        cell.editList.addTarget(self, action: #selector(editList(_:)), for: .touchUpInside)
        
        return cell
    }
    
    
}
