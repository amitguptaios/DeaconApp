//
//  PoliceBAckupVC.swift
//  Deacon
//
//  Created by Apple on 10/07/21.
//

import UIKit

class ServiceLineReportVC2: UIViewController {
    @IBOutlet weak var tableview:UITableView!

    var params:[String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Service Line Report")
        appNavigationWithBackButton(navigationTitle: "Service Line Report")
    }
    func configureViews(){
        let nib = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "CommonCell")
        let nib2 = UINib(nibName: "DatePickerCell", bundle: nil)
        tableview.register(nib2, forCellReuseIdentifier: "DatePickerCell")
        let nib3 = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib3, forCellReuseIdentifier: "CommonCell")
        let nib4 = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib4, forCellReuseIdentifier: "CommonCell")
        let nib5 = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib5, forCellReuseIdentifier: "CommonCell")
        let nib6 = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib6, forCellReuseIdentifier: "CommonCell")
        let nib7 = UINib(nibName: "CommonCell", bundle: nil)
        tableview.register(nib7, forCellReuseIdentifier: "CommonCell")
        let nib8 = UINib(nibName: "TwoRadioButtonCell", bundle: nil)
        tableview.register(nib8, forCellReuseIdentifier: "TwoRadioButtonCell")
        let nib9 = UINib(nibName: "AttachmentCell", bundle: nil)
        tableview.register(nib9, forCellReuseIdentifier: "AttachmentCell")
        let nib10 = UINib(nibName: "AttachmentCell", bundle: nil)
        tableview.register(nib10, forCellReuseIdentifier: "AttachmentCell")
        let nib11 = UINib(nibName: "AttachmentCell", bundle: nil)
        tableview.register(nib11, forCellReuseIdentifier: "AttachmentCell")
        let nib12 = UINib(nibName: "SubmitCell", bundle: nil)
        tableview.register(nib12, forCellReuseIdentifier: "SubmitCell")
        let nib13 = UINib(nibName: "TitleCell", bundle: nil)
        tableview.register(nib13, forCellReuseIdentifier: "TitleCell")
        let nib14 = UINib(nibName: "NextCell", bundle: nil)
        tableview.register(nib14, forCellReuseIdentifier: "NextCell")
        tableview.dataSource = self
        tableview.delegate = self
    }
}
extension ServiceLineReportVC2:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 14
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Service Length *"
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Lead Removed *"
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Service Depth *"
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main Size *"
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main Depth *"
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main To Curb Distance *"
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as? TitleCell  else { return UITableViewCell()}
                cell.TitleLabel?.text = "As Built Information"
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "CB LOC Corners Of House"
            return cell
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as? TitleCell  else { return UITableViewCell()}
                cell.TitleLabel?.text = "Excavation Info"
            return cell
        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Curb Size / Depth"
            return cell
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main Excav Size"
            return cell
        case 11:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = " Trench Excav Size"
            return cell
        case 12:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Gas Excav Size"
            return cell
            
        case 13:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NextCell") as? NextCell  else { return UITableViewCell()}
            cell.delegateNextCell = self
            cell.indexPath = indexPath
            return cell
        default:
            return UITableViewCell()
        }
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
         if indexPath.section == 6 ||  indexPath.section == 8 {
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
extension ServiceLineReportVC2:NextCellDelegate{
    func didNextButton(_ indexPath: IndexPath) {
        print("didNextButton")
        Router.goToServiceLineReportVC3(target: self)
    }
}