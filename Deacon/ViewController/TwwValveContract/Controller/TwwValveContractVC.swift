//
//  TwwValveContractVC.swift
//  Deacon
//
//  Created by ABC on 11/07/21.
//

import UIKit

class TwwValveContractVC: UIViewController {
    @IBOutlet weak var tableview:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        appNavigationWithBackButton(navigationTitle: "Tww Valve Contract")
    }
    
    func configureViews(){
        let nib = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "CommonCell")
        let nib1 = UINib(nibName: "SixRadioButtonCell", bundle: nil)
        tableview.register(nib1, forCellReuseIdentifier: "SixRadioButtonCell")
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
extension TwwValveContractVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 19
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Valve ID*"
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SixRadioButtonCell") as? SixRadioButtonCell  else { return UITableViewCell()}
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Others"
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Others"
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            return cell
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell") as? DatePickerCell  else { return UITableViewCell()}
                cell.dateTextfield?.placeholder = "Date*"
             return cell
        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimePickerCell") as? TimePickerCell  else { return UITableViewCell()}
                cell.timeTextfield?.placeholder = "Time Start Exercise*"
             return cell
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimePickerCell") as? TimePickerCell  else { return UITableViewCell()}
                cell.timeTextfield?.placeholder = "Time Start Exercise*"
             return cell
        case 11:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwoRadioButtonCell") as? TwoRadioButtonCell  else { return UITableViewCell()}
            return cell
            
        case 12:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Valve Image Before*"
            return cell
            
        case 13:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Valve Image After*"
            return cell
            
            
        case 14:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Optional Image"
            return cell
     
        case 15:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Optional Image"
            return cell
     
        case 16:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            
            cell.attachmentTitleLabel.text = "Optional Image"
            return cell
     
        case 17:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Closest Address / Notes*"
            return cell

        case 18:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitCell") as? SubmitCell  else { return UITableViewCell()}
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 150
        }
        else if indexPath.section == 4 || indexPath.section == 6  || indexPath.section == 7 {
            return 120
        }
        else if indexPath.section == 11 {
            return 100
        }
        else if indexPath.section == 12 || indexPath.section == 13 || indexPath.section == 14  || indexPath.section == 15 || indexPath.section == 16  {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row:\(indexPath.row)")
        if indexPath.row  == 18{
            Router.goToThankYouVC(target: self)
        }
    }
}
