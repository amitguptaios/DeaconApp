//
//  DependencyVC.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import Foundation
import  UIKit
class DependencyVC:ViewControllerFactory{
    
    static func makeSearchBarVC() -> SearchBarController? {
        SearchBarController.instantiate()

    }
    
    static func makeSearchDetailsVC() -> SearchDetailsVC? {
        guard let searchDetailsController = UIStoryboard(.main).instantiateViewController(withIdentifier: SearchDetailsVC.className) as? SearchDetailsVC else {
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
