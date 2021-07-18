//
//  TwwValveContractVC.swift
//  Deacon
//
//  Created by ABC on 11/07/21.
//

import UIKit

class TwwValveContractVC: UIViewController {
    @IBOutlet weak var tableview:UITableView!
    //Mark:Variable
    var params:[String:Any] = [:]
    var imageData:[Data] = []
    var twwValveContractModel:TwwValveContractModel?
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
    func prepareCellData(){

        params["Datetime"] = ""
       // params["Remarks"] = ""
 
         if imageData1 != nil {
            imageData.append(imageData1!)
            imageType.append(imageType1 ?? nil)
        }else{
            imageData.append(Data())
            imageType.append(nil)
        }
        if imageData2 != nil {
            imageData.append(imageData2!)
            imageType.append(imageType2 ?? nil)
        }else{
            imageData.append(Data())
            imageType.append(nil)
        }
        if imageData3 != nil {
            imageData.append(imageData3!)
            imageType.append(imageType3 ?? nil)
        }else{
            imageData.append(Data())
            imageType.append(nil)
        }
        if imageData4 != nil {
            imageData.append(imageData4!)
            imageType.append(imageType4 ?? nil)
        }else{
            imageData.append(Data())
            imageType.append(nil)
        }
        if imageData5 != nil {
            imageData.append(imageData5!)
            imageType.append(imageType5 ?? nil)
        }else{
            imageData.append(Data())
            imageType.append(nil)
        }
        
        
        let url = WebServiceNames.EndPoints.TwwValve.url
        WebServices.requestApiWithDictParam(url: url, requestType: "POST", params:params, imageData: imageData, imageType: imageType , imageParameter: "OptionalImage", modalType:TwwValveContractModel.self) {[weak self ](result, message, status ) in
        if status {
            self?.GoToThankYouVC()
            self?.AskConfirmation(title: "", message: "Data Submitted Successfully", isCancel: false) { (result) in
                    if result { //User has clicked on Ok
                       // self?.navigationController?.popViewController(animated: true)
                    } else { //User has clicked on Cancel

                    }
                }
        }else{
            
            
        }
    }
 }
    func GoToThankYouVC()  {
        Router.goToThankYouVC(target: self)
    }
}
extension TwwValveContractVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Crew Leader*"
            cell.crewLeaderTextfield?.text = params["CrewLeader"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["CrewLeader"] = newText
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Valve ID*"
            cell.crewLeaderTextfield?.text = params["ValveID"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["ValveID"] = newText
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SixRadioButtonCell") as? SixRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Valve Size*"
            cell.setTitle(title1: "6", title2: "12", title3: "8", title4: "16", title5: "10", title6: "Others")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["ValveSize"] = newText
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Others"
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Valve Start Position*"
            cell.setTitle(title1: "Open", title2: "Closed", title3: "Others")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["ValveStartPosition"] = newText
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Others"
            cell.crewLeaderTextfield?.text = ""
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Number Of Turns*"
            cell.setTitle(title1: "10", title2: "15", title3: "Could Not Find")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["No_Of_Turns"] = newText
            }
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Is Packing Leaking?"
            cell.setTitle(title1: "Yes", title2: "No", title3: "Others")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["IsPacking_Leaking"] = newText
            }
            return cell
            
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Others"
            cell.crewLeaderTextfield?.text = ""
            return cell
            
        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell") as? DatePickerCell  else { return UITableViewCell()}
                cell.dateTextfield?.placeholder = "Date*"
            cell.dateTextfield?.text = params["Date"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["Date"] = newText
            }
             return cell
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimePickerCell") as? TimePickerCell  else { return UITableViewCell()}
                cell.timeTextfield?.placeholder = "Time Start Exercise*"
            cell.timeTextfield?.text = params["Date"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["TimeStart_Exercise"] = newText
            }
             return cell
        case 11:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimePickerCell") as? TimePickerCell  else { return UITableViewCell()}
                cell.timeTextfield?.placeholder = "Time Start Exercise*"
            cell.timeTextfield?.text = params["Date"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["TimeEnd_Exercise"] = newText
            }
             return cell
        case 12:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwoRadioButtonCell") as? TwoRadioButtonCell  else { return UITableViewCell()}
            cell.titleLabel.text = "Was Valve Box Raised*"
            cell.setTitle(title1: "Yes", title2: "No")
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["WasValveBox"] = newText
            }
            return cell
            
        case 13:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Valve Image Before*"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData1 = newdata
                self?.imageType1 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData1 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
            
        case 14:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Valve Image After*"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData2 = newdata
                self?.imageType2 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData1 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
            
            
        case 15:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Optional Image"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData3 = newdata
                self?.imageType3 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData1 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
     
        case 16:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Optional Image"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData4 = newdata
                self?.imageType5 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData1 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
     
        case 17:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Optional Image"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData5 = newdata
                self?.imageType5 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData1 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
     
        case 18:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
                cell.crewLeaderTextfield?.placeholder = "Closest Address / Notes*"
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["Remarks"] = newText
            }
            return cell

        case 19:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitCell") as? SubmitCell  else { return UITableViewCell()}
            cell.didEndEditAction = {[weak self]() in
            self?.prepareCellData()
            }
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
        else if indexPath.section == 12 {
            return 100
        }
        else if indexPath.section == 13 || indexPath.section == 14 || indexPath.section == 15  || indexPath.section == 16 || indexPath.section == 17  {
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
        switch indexPath.section {
        case 13, 14, 15, 16, 17:
            let cell  = tableview.cellForRow(at: indexPath) as? AttachmentCell
            cell?.getImageFromImagePicker(VC: self)
        default:
        break
        }
    }
}
