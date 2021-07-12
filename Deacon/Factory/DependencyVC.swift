//
//  DependencyVC.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import Foundation
import  UIKit
class DependencyVC:ViewControllerFactory{
    
    static func makePoliceBackupVC() -> PoliceBackupVC? {
        guard let policeBAckupVCController = UIStoryboard(.main).instantiateViewController(withIdentifier: PoliceBackupVC.className) as? PoliceBackupVC  else {
            return nil
        }
        return policeBAckupVCController
    }
    
    static func makeTopSoilFeed() -> TopSoilSeedVC? {
        guard let topSoilSeedController = UIStoryboard(.main).instantiateViewController(withIdentifier: TopSoilSeedVC.className) as? TopSoilSeedVC  else {
            return nil
        }
        return topSoilSeedController
    }
    
    
    static func makeSearchBarVC() -> SearchBarController? {
        SearchBarController.instantiate()

    }
    
    static func makeSearchDetailsVC() -> SearchDetailsController? {
        guard let searchDetailsController = UIStoryboard(.main).instantiateViewController(withIdentifier: SearchDetailsController.className) as? SearchDetailsController else {
            return nil
        }
        return searchDetailsController
    }
    
    static func makeHomePageVC() -> HomePageVC? {
        guard let homePageController = UIStoryboard(.main).instantiateViewController(withIdentifier: HomePageVC.className) as? HomePageVC else {
            return nil
        }
        return homePageController
    }
    
    static func makeTwwValveContractVC() -> TwwValveContractVC? {
        guard let TwwValveContractVC = UIStoryboard(.main).instantiateViewController(withIdentifier: TwwValveContractVC.className) as? TwwValveContractVC else {
            return nil
        }
        return TwwValveContractVC
    }
    static func makeServiceLineReportVC() -> ServiceLineReportVC? {
        guard let ServiceLineReportVC = UIStoryboard(.main).instantiateViewController(withIdentifier: ServiceLineReportVC.className) as? ServiceLineReportVC else {
            return nil
        }
        return ServiceLineReportVC
    }
    static func makeThankYouVC() -> ThankYouVC? {
        guard let ThankYouVC = UIStoryboard(.main).instantiateViewController(withIdentifier: ThankYouVC.className) as? ThankYouVC else {
            return nil
        }
        return ThankYouVC
    }
}
