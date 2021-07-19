//
//  PoliceBAckupVC.swift
//  Deacon
//
//  Created by Apple on 10/07/21.
//

import UIKit

class ServiceLineReportVC2: UIViewController {
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
    //MARK:- Check Validations
    @objc func checkValidation() {
        print("checkValidation:\(params)")
        if params["ServiceLength"] == nil || params["LeadRemove"] == nil ||
            params["ServiceDepth"] == nil ||  params["MainSize"]  == nil ||
            params["MainDepth"]  == nil || params["MainCurbDis"]  == nil {
            print("validation not success")
            self.AskConfirmation(title: "", message: "Please fill all required field", isCancel: false) { (result) in
            }
        }else{
            //Router.goToServiceLineReportVC3(target: self)
            let vc = storyboard?.instantiateViewController(identifier: "ServiceLineReportVC3") as! ServiceLineReportVC3
            vc.params = params
            self.navigationController?.pushViewController(vc, animated: true)
            print("params:\(params)")
            print("validation  success")
        }
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
            cell.crewLeaderTextfield?.text = params["ServiceLength"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["ServiceLength"] = newText
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Lead Removed *"
            cell.crewLeaderTextfield?.text = params["LeadRemove"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["LeadRemove"] = newText
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Service Depth *"
            cell.crewLeaderTextfield?.text = params["ServiceDepth"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["ServiceDepth"] = newText
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main Size *"
            cell.crewLeaderTextfield?.text = params["MainSize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["MainSize"] = newText
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main Depth *"
            cell.crewLeaderTextfield?.text = params["MainDepth"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["MainDepth"] = newText
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main To Curb Distance *"
            cell.crewLeaderTextfield?.text = params["MainCurbDis"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["MainCurbDis"] = newText
            }
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as? TitleCell  else { return UITableViewCell()}
                cell.TitleLabel?.text = "As Built Information"
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "CB LOC Corners Of House"
            cell.crewLeaderTextfield?.text = params["CBlocCorner"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["CBlocCorner"] = newText
            }
            return cell
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as? TitleCell  else { return UITableViewCell()}
                cell.TitleLabel?.text = "Excavation Info"
            return cell
        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Curb Size / Depth"
            cell.crewLeaderTextfield?.text = params["Curbsize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["Curbsize"] = newText
            }
            return cell
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Main Excav Size"
            cell.crewLeaderTextfield?.text = params["MainExcavSize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["MainExcavSize"] = newText
            }
            return cell
        case 11:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = " Trench Excav Size"
            cell.crewLeaderTextfield?.text = params["TrenchExcavSize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["TrenchExcavSize"] = newText
            }
            return cell
        case 12:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Gas Excav Size"
            cell.crewLeaderTextfield?.text = params["GasExcavSize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["GasExcavSize"] = newText
            }
            return cell
            
        case 13:
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
