//
//  Router.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import UIKit
import  Foundation
class Router{
    
    class func goToHomePageVC(target:UIViewController){
        if  let homePage  = DependencyVC.makeHomePageVC()  {
            target.navigationController?.pushViewController(homePage, animated: true)
        }
    }
    
    class func goToSearchDetailsVC(target:UIViewController,getserachData:SearchModal){
        if  let searchDetails  = DependencyVC.makeSearchDetailsVC()  {
            searchDetails.setSearchModal = getserachData
            target.navigationController?.pushViewController(searchDetails, animated: true)
        }
    }
    
    class func goTosearchVC(target:UIViewController){
        if  let searchDetails  = DependencyVC.makeSearchBarVC()  {
            target.navigationController?.pushViewController(searchDetails, animated: false)
        }
    }
    
    class func goToTopSoilSeed(target:UIViewController){
        if  let topSilSeed  = DependencyVC.makeTopSoilFeed()  {
            target.navigationController?.pushViewController(topSilSeed, animated: true)
        }
    }
    class func goToPoilceBackup(target:UIViewController){
        if  let topSilSeed  = DependencyVC.makePoliceBackupVC() {
            target.navigationController?.pushViewController(topSilSeed, animated: true)
        }
    }
    class func goToTWWValveContract(target:UIViewController){
        if  let topSilSeed  = DependencyVC.makeTwwValveContractVC() {
            target.navigationController?.pushViewController(topSilSeed, animated: true)
        }
    }
    
    
}
