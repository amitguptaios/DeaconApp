//
//  ViewControllerFactory.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import Foundation
protocol ViewControllerFactory {
    static func makeHomePageVC()->HomePageVC?
    static func makeSearchDetailsVC()->SearchDetailsController?
    static func makeSearchBarVC()->SearchBarController?

}
