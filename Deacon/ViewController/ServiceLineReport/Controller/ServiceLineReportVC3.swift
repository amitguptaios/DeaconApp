//
//  PoliceBAckupVC.swift
//  Deacon
//
//  Created by Apple on 10/07/21.
//

import UIKit

class ServiceLineReportVC3: UIViewController {
    @IBOutlet weak var tableview:UITableView!
    var params:[String:Any] = [:]
    var imageData:[Data] = []
    var serviceLineReportModel:ServiceLineReportModel?
    var imageType:[ImageType?] = []
    var imageData1:Data?
    var imageData2:Data?
    var imageData3:Data?
    var imageData4:Data?
    var imageData5:Data?
    var imageData6:Data?
    var imageData7:Data?
    var imageData8:Data?
    var imageData9:Data?
    var imageData10:Data?
    var imageData11:Data?
    var imageType1:ImageType?
    var imageType2:ImageType?
    var imageType3:ImageType?
    var imageType4:ImageType?
    var imageType5:ImageType?
    var imageType6:ImageType?
    var imageType7:ImageType?
    var imageType8:ImageType?
    var imageType9:ImageType?
    var imageType10:ImageType?
    var imageType11:ImageType?
    var imageType12:ImageType?
    
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
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func prepareCellData(){
        params["Datetime"] = ""
        params["Remarks"] = ""
        
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
        if Reachability.isConnectedToNetwork(){
            saveOfflineData()
            return
        }
        let url = WebServiceNames.EndPoints.ServiceLine.url
        WebServices.requestApiWithDictParam(url: url, requestType: "POST", params:params, imageData: imageData, imageType: imageType , imageParameter: "ExtraPhoto", modalType:ServiceLineReportModel.self) {[weak self ](result, message, status ) in
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
    func saveOfflineData(){
        let url = WebServiceNames.EndPoints.ServiceLine.url
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
        
       let getdataModal =  DataModal(imageData: imageData, imageParameter:"ExtraPhoto", imageType: imageTypeValue, params: params, requestType:"POST", url: url, uuID: UUID())
        let manager = DataManager()
        manager.createData(data: getdataModal)
        
        self.AskConfirmation(title: "", message: "Data Submitted Successfully", isCancel: false) { (result) in
                if result { //User has clicked on Ok
                    self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}

extension ServiceLineReportVC3:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        13
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell  else { return UITableViewCell()}
            cell.crewLeaderTextfield?.placeholder = "Notes about install / Work"
            cell.crewLeaderTextfield?.text = params["GrassSize"] as? String ??  ""
            cell.didEndEditAction = {[weak self] (newText) in
            self?.params["GrassSize"] = newText
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Precon Photo"
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
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Markout Photo"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData2 = newdata
                self?.imageType2 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData2 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Curb Stop Photo"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData3 = newdata
                self?.imageType3 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData3 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Old Tap"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData4 = newdata
                self?.imageType4 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData4 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "New Tap"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData5 = newdata
                self?.imageType5 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData5 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Service Line"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData6 = newdata
                self?.imageType6 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData6 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Concrete Thickness"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData7 = newdata
                self?.imageType7 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData7 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
            
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Work Sheet"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData8 = newdata
                self?.imageType8 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData8 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell

        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "End Of Day Photo"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData9 = newdata
                self?.imageType9 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData9 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Extra Photo"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData10 = newdata
                self?.imageType10 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData10 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
        case 11:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentCell") as? AttachmentCell  else { return UITableViewCell()}
            cell.attachmentTitleLabel.text = "Extra Photo"
            cell.didEndEditAction = { [weak self](newdata,imageType) in
                self?.imageData11 = newdata
                self?.imageType11 = imageType
                cell.checkImageView.image = UIImage.init(named: "right")
            }
            if imageData11 != nil{
                cell.checkImageView.image = UIImage.init(named: "right")
            }else{
                cell.checkImageView.image = UIImage()
            }
            return cell
            
        case 12:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitCell") as? SubmitCell  else { return UITableViewCell()}
            cell.delegateSubmitCell = self
            cell.indexPath = indexPath
            cell.didEndEditAction = {[weak self]() in
            self?.prepareCellData()
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 12{
            return 70
        }
       
        return 40
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
        case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11:
            let cell  = tableview.cellForRow(at: indexPath) as? AttachmentCell
            cell?.getImageFromImagePicker(VC: self)
        default:
        break
        }
    }
}
extension ServiceLineReportVC3:SubmitCellDelegate{
    func didSubmitButton(_ indexPath: IndexPath) {
        print("didSubmitButton")
      //  Router.goToThankYouVC(target: self)
    }
}
