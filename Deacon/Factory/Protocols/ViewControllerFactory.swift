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
    static func makeTopSoilFeed()->TopSoilSeedVC?
    static func makePoliceBackupVC()->PoliceBackupVC?
    static func makeTwwValveContractVC()->TwwValveContractVC?
    static func makeServiceLineReportVC()->ServiceLineReportVC?
    static func makeServiceLineReportVC2()->ServiceLineReportVC2?
    static func makeServiceLineReportVC3()->ServiceLineReportVC3?
    static func makeThankYouVC()->ThankYouVC?
}

