//
//  HomePageVC.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var moduleCollectionView: UICollectionView!
    @IBOutlet weak var scrlView: UIScrollView!
    
    var arrModules = NSMutableArray()
    var arrModuleImages = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDisplay()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    // MARK: Setup Display
    func setupDisplay()  {
        registerNib()
        scrlView.scrollsToTop = true
        moduleCollectionView.delegate = self
        moduleCollectionView.dataSource = self
        arrModules = ["Tww valve contract","Service line report","Top soil seed","Meter report","Infra red burn report","Cleaning report","Hours Input","Concrete Road","Saw Cut","Sidewalk/Curb Install","Police Backup","Bypass Install"]
        
        arrModuleImages = ["valve_contract_1","Service_line_2","Top_soil_seed_3","Meter_report_4","Infra_red_burn_5","Cleaning_report_6","Hours_Input_7","Concrete_Road_8","Saw_Cut_09","SidewalkCurb_10","Police_Backup_11","Bypass_Install_12"]
    }
    // MARK: Setup Display
    
    @IBAction func didPressedSettingButton(){
        Router.goTosearchVC(target: self)
        
    }
    @IBAction func didPressedSearchButton(){
        Router.goTosearchVC(target: self)
    }
}

extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource and UICollectionViewDelegateFlowLayout
    func registerNib() {
        let nib = UINib(nibName: "ModuleCollectionViewCell", bundle: nil)
        moduleCollectionView.register(nib, forCellWithReuseIdentifier: "ModuleCollectionViewCell")
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrModules.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ModuleCollectionViewCell", for: indexPath) as? ModuleCollectionViewCell  else { return UICollectionViewCell()}
        cell.moduleNameLabel.text = arrModules[indexPath.row] as? String
        let imgName = arrModuleImages.object(at: indexPath.row) as? String
        cell.moduleImageView.image = UIImage(named: imgName!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("did select index:\(indexPath.row),title:\(arrModules[indexPath.row] as? String)")
        if indexPath.row == 0{
            //Tww valve contract
            Router.goToTWWValveContract(target: self)
        }else if indexPath.row == 1 {
            //Service line report
            Router.goToServiceLineReportVC(target: self)
        }else if indexPath.row == 2 {
            //Top soil seed
            Router.goToTopSoilSeed(target: self)
        }else if indexPath.row == 3 {
            //Meter report
        }else if indexPath.row == 4 {
            //Infra red burn report
        }else if indexPath.row == 5 {
            //Cleaning report
        }else if indexPath.row == 6 {
            //Hours Input
            
        }else if indexPath.row == 7 {
            //Concrete Road
        }else if indexPath.row == 8 {
            //Saw Cut
        }else if indexPath.row == 9 {
            //Sidewalk/Curb Install
        }else if indexPath.row == 10 {
            //Police Backup
            Router.goToPoilceBackup(target: self)
        }else if indexPath.row == 11 {
            //Bypass Install
        } else {
            
        }
    }
}
extension HomePageVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 3.0
        return CGSize(width: size, height: size + 35)
    }
    
}

