//
//  ServiceLineReportVC.swift
//  Deacon
//
//  Created by ABC on 11/07/21.
//

import UIKit

class ServiceLineReportVC: UIViewController {

    @IBOutlet weak var tableview:UITableView!
    //Mark:Variable
    var params:[String:Any] = [:]
    var imageData:[Data] = []
    var topSoilFeedModal:TopSoilFeedModal?
    var imageType:[ImageType?] = []
    var imageData1:Data?
    var imageData2:Data?
    var imageData3:Data?
    var imageData4:Data?
    var imageData5:Data?
    var imageType1:ImageType?
    var imageType2:ImageType?
    var imageType3:ImageType?
    var imageType4:ImageType?
    var imageType5:ImageType?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        appNavigationWithBackButton(navigationTitle: "Service Line Report")
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
        let nib10 = UINib(nibName: "FourRadioButtonCell", bundle: nil)
        tableview.register(nib10, forCellReuseIdentifier: "FourRadioButtonCell")
        let nib11 = UINib(nibName: "FiveRadioButtonCell", bundle: nil)
        tableview.register(nib11, forCellReuseIdentifier: "FiveRadioButtonCell")
        let nib12 = UINib(nibName: "NextCell", bundle: nil)
        tableview.register(nib12, forCellReuseIdentifier: "NextCell")
        tableview.dataSource = self
        tableview.delegate = self
    }
    //MARK:- Check Validations
    @objc func checkValidation() {
        print("checkValidation:\(params)")
        if params["Crew_leader"] == nil || params["Date"] == nil || params["WorkAddress"] == nil || params["WorkOrderNumber"] == nil{
            print("validation not success")
            self.AskConfirmation(title: "", message: "Please fill all required field", isCancel: false) { (result) in
            }
        }else{
            //  Router.goToServiceLineReportVC2(target: self)
              let vc = storyboard?.instantiateViewController(identifier: "ServiceLineReportVC2") as! ServiceLineReportVC2
              vc.params = params
              self.navigationController?.pushViewController(vc, animated: true)
              print("params:\(params)")
            print("validation  success")
        }
    }
}
extension ServiceLineReportVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        9
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Crew Leader*"
            cell.crewLeaderTextfield?.text = params["Crew_leader"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["Crew_leader"] = newText
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell") as? DatePickerCell  else { return UITableViewCell()}
                cell.dateTextfield?.placeholder = "Date*"
            cell.dateTextfield?.text = params["Date"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["Date"] = newText
            }
             return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Work Address*"
            cell.crewLeaderTextfield?.text = params["WorkAddress"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["WorkAddress"] = newText
            }
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Work Order Number*"
            cell.crewLeaderTextfield?.text = params["WorkOrderNumber"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["WorkOrderNumber"] = newText
            }
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FourRadioButtonCell") as? FourRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Restoration Type"
            cell.setTitle(title1: "GRASS", title2: "ASPHALT", title3: "CONCRETE", title4: "Others")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["RestorationType"] = newText
            }
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Others"
            cell.crewLeaderTextfield?.text = params["GrassSize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["GrassSize"] = newText
            }
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FourRadioButtonCell") as? FourRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Service Material Type(Suez Side)"
            cell.setTitle(title1: "GZ", title2: "LZ", title3: "BR", title4: "CP")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["SuezSide"] = newText
            }
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FiveRadioButtonCell") as? FiveRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Service Material Type(Customer Side)"
            cell.setTitle(title1: "GZ", title2: "LZ", title3: "BR", title4: "CP" , title5: "Unknown")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["CustomerSize"] = newText
            }
            return cell
 
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NextCell") as? NextCell  else { return UITableViewCell()}
            cell.didEndEditAction = {[weak self]() in
                self?.checkValidation()
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 4 || indexPath.section == 6{
            return 130
        }
        else if indexPath.section == 7{
            return 150
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
