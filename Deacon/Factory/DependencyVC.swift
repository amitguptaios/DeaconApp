//
//  DependencyVC.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import Foundation
import  UIKit
class DependencyVC:ViewControllerFactory{
    static func makeTopSoilFeed() -> TopSoilSeed? {
        guard let topSoilSeedController = UIStoryboard(.main).instantiateViewController(withIdentifier: TopSoilSeed.className) as? TopSoilSeed  else {
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
    
}
