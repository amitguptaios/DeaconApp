//
//  TopSoilSeed.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class TopSoilSeedVC: UIViewController {
    @IBOutlet weak var tableview:UITableView!
    var params:[String:Any] = [:]
    var imageData:[Data] = []
    var topSoilFeedModal:TopSoilFeedModal?
    var imageType:[ImageType?] = []
    var imageData1:Data?
    var imageData2:Data?
    var imageData3:Data?
    var imageType1:ImageType?
    var imageType2:ImageType?
    var imageType3:ImageType?
    var isCheck = false
    var imageParameter:[String] = []
    var imageObject:[ImageModal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        appNavigationWithBackButton(navigationTitle: "Top Soil seed")
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
        
        for i in 0..<3{
            imageObject.append(ImageModal(imageData: Data(), imageType: nil, imageParameter: ("Photos\(i+1)")))
        }
    }
    
    func prepareCellData(){
        let result =  isCheck ? "TopSoil": ""
        params["Datetime"] = ""
        params["Remarks"] = ""
        params["WorkPerformed"]  =  result
        for i in 0..<imageObject.count{
            imageData.append(imageObject[i].imageData!)
            imageType.append(imageObject[i].imageType ?? nil)
            imageParameter.append(imageObject[i].imageParameter)
        }
        if !Reachability.isConnectedToNetwork(){
            saveOfflineData()
            return
        }
        
        let url = WebServiceNames.EndPoints.topSoilSeed.url
        WebServices.requestApiWithDictParam(url: url, requestType:"POST", params:params, imageData: imageData, imageType: imageType , imageParameter:imageParameter, modalType:TopSoilFeedModal.self) {[weak self ](result, message, status ) in
            if status {
                self?.GoToThankYouVC()
            }else{
                self?.AskConfirmation(title: "", message: "Something went wrong", isCancel: false) { (result) in
                    if result { //User has clicked on Ok
                        self?.navigationController?.popViewController(animated: true)
                    } else { //User has clicked on Cancel
                        
                    }
                }
            }
        }
    }
    
    
    func saveOfflineData(){
        let url = WebServiceNames.EndPoints.topSoilSeed.url
        var imageTypeValue:[String] = []
        imageType.forEach({ (data) in
            switch data{
            case.jpeg :
                imageTypeValue.append("jpeg")
            case .none:
                imageTypeValue.append("")
            case .some(.png):
                imageTypeValue.append("png")
            }
        })
        
        let getdataModal =  DataModal(imageData: imageData, imageParameter:imageParameter, imageType: imageTypeValue, params: params, requestType:"POST", url: url, uuID: UUID())
        let manager = DataManager()
        manager.createData(data: getdataModal)
        
        self.AskConfirmation(title: "", message: "Data Submitted Successfully", isCancel: false) { (result) in
            if result { //User has clicked on Ok
                self.GoToThankYouVC()
            }
        }
    }
    //MARK:- Check Validations
    @objc func checkValidation() {
        print("checkValidation:\(params)")
        if params["CrewLeader"] == nil || params["Date"] == nil ||
            params["WorkAddress"] == nil ||  params["Town_job"]  == nil ||
            params["WorkComplete"]  == nil{
            print("validation not success")
            self.AskConfirmation(title: "", message: "Please fill all required field", isCancel: false) { (result) in
            }
        }else{
            self.prepareCellData()
        }
    }
    func GoToThankYouVC()  {
        Router.goToThankYouVC(target: self)
    }
}

extension TopSoilSeedVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        12
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwoRadioButtonCell") as? TwoRadioButtonCell  else { return UITableViewCell()}
            cell.setTitle(title1: "North B", title2: "Rutheford")
            cell.didEndEditAction = {[weak self] (newText) in
                self?.params["Town_job"] = newText
            }
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell") as? CheckBoxCell  else { return UITableViewCell()}
            cell.SetImageCheckBox(status:isCheck)
            cell.didEndEditAction = {[weak self] (newText) in
                self?.isCheck = newText
                if newText {
                    cell.checkBoxImageView.image = UIImage(named: "check-box")
                }else{
                    cell.checkBoxImageView.image = UIImage(named: "uncheck_box")
                }
            }
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Grass Size*"
            cell.crewLeaderTextfield?.text = params["GrassSize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
                self?.params["GrassSize"] = newText
            }
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeRadioButtonCell") as? ThreeRadioButtonCell  else { return UITableViewCell()}
            cell.didEndEditAction = {[weak self] (newText) in
                self?.params["WorkComplete"] = newText
            }
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Photo 1*"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageObject[0].imageData = newdata
                self?.imageObject[0].imageType = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if self.imageObject[0].imageData != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Photo 2"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageObject[1].imageData = newdata
                self?.imageObject[1].imageType = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if self.imageObject[1].imageData != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
            
        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Photo 3"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageObject[2].imageData = newdata
                self?.imageObject[2].imageType = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if self.imageObject[2].imageData != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
            
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Notes / Comments"
            cell.crewLeaderTextfield?.text = params["Note"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
                self?.params["Note"] = newText
            }
            return cell
            
        case 11:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitCell") as? SubmitCell  else { return UITableViewCell()}
            cell.didEndEditAction = {[weak self]() in
                self?.checkValidation()
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 ||  indexPath.section == 4{
            return 100
        }
        else if indexPath.section == 6{
            return 120
        }
        else if indexPath.section == 7 ||  indexPath.section == 8 || indexPath.section == 9{
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
        case 7, 8, 9:
            let cell  = tableview.cellForRow(at: indexPath) as? AttachmentCell
            cell?.getImageFromImagePicker(VC: self)
        default:
            break
        }
    }
}
