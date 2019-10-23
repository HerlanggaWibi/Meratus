//
//  ScheduleList.swift
//  Meratus
//
//  Created by MTMAC18 on 18/10/19.
//  Copyright © 2019 Wibi Herlangga. All rights reserved.
//

import UIKit

class ScheduleList: UIViewController {

    let viewModel = ScheduleViewModel(scheduleServices1: ScheduleServices())
    
    var listDataSchedule: [ListScheduleModel?]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lblKeterangan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        
        guard let list = listDataSchedule else {return}
        
        if list.isEmpty {
            print("listDataSchedule: \(list)")
            lblKeterangan.text = "No Data"
        }
        else {
            lblKeterangan.text = listDataSchedule?[0]?.rute
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        listDataSchedule?.removeAll()
    }
    
    
    

}

extension ScheduleList: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDataSchedule?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScheduleListCell
        cell.titleList.text = listDataSchedule?[indexPath.row]?.vslgnm1
        cell.etb_pol.text = ":   " + (listDataSchedule?[indexPath.row]!.etbpoldtterm)!
        cell.eta.text = ":   " + (listDataSchedule?[indexPath.row]!.etaPod)!
        cell.etd.text = ":   " + (listDataSchedule?[indexPath.row]!.etdPol)!
        cell.closingCargo.text = ":   " + (listDataSchedule?[indexPath.row]!.closedt)!
        cell.route.text = ":   " + (listDataSchedule?[indexPath.row]!.rute)!
        cell.btnCopy.borderBtn()
        cell.btnShare.borderBtn()
        cell.btnBookNow.borderBtn()
        cell.dropShadow()
        
        return cell
    }
    
    
}

