//
//  TopSoilSeed.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class TopSoilSeedVC: UIViewController {
    @IBOutlet weak var tableview:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        self.title = "Top Soil Feed"
    }
    
    func configureViews(){
        let nib = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "CommonCell")
        let nib2 = UINib(nibName: "DatePickerCell", bundle: nil)
        tableview.register(nib2, forCellReuseIdentifier: "DatePickerCell")
        let nib3 = UINib(nibName: "TimePickerCell", bundle: nil)
        tableview.register(nib3, forCellReuseIdentifier: "TimePickerCell")
        let nib4 = UINib(nibName: "TwoRadioButtonCell", bundle: nil)
        tableview.register(nib4, forCellReuseIdentifier: "TwoRadioButtonCell")
        let nib5 = UINib(nibName: "ThreeRadioButtonCell", bundle: nil)
        tableview.register(nib5, forCellReuseIdentifier: "ThreeRadioButtonCell")
        let nib6 = UINib(nibName: "ThreeRadioButtonCell", bundle: nil)
        tableview.register(nib6, forCellReuseIdentifier: "ThreeRadioButtonCell")
        let nib7 = UINib(nibName: "AttachmentCell", bundle: nil)
        tableview.register(nib7, forCellReuseIdentifier: "AttachmentCell")
        let nib8 = UINib(nibName: "SubmitCell", bundle: nil)
        tableview.register(nib8, forCellReuseIdentifier: "SubmitCell")
        let nib9 = UINib(nibName: "CheckBoxCell", bundle: nil)
        tableview.register(nib9, forCellReuseIdentifier: "CheckBoxCell")
        tableview.dataSource = self
        tableview.delegate = self
    }

}
extension TopSoilSeedVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        11
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Crew Leader*"
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell") as? DatePickerCell  else { return UITableViewCell()}
                cell.dateTextfield?.placeholder = "Date*"
             return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Work Address*"
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwoRadioButtonCell") as? TwoRadioButtonCell  else { return UITableViewCell()}
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell") as? CheckBoxCell  else { return UITableViewCell()}
           
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Photo 1*"
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Photo 2"
            return cell

        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Photo 3"
            return cell

        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Notes / Comments"

            return cell
            
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitCell") as? SubmitCell  else { return UITableViewCell()}

            return cell
        default:
            return UITableViewCell()
        }
        
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 || indexPath.section == 4{
            return 100
        }
        else if indexPath.section == 5{
            return 120
        }
        else if indexPath.section == 6 ||  indexPath.section == 7 || indexPath.section == 8{
            return 40
        }
        
        return 70
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 20))
            view.backgroundColor = .clear
            return view
        }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 20.0
       }
}
