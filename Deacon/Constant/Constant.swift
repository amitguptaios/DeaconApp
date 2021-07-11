//
//  Constant.swift
//  Deacon
//
//  Created by Apple on 10/07/21.
//

import Foundation
import UIKit


struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_7        = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_7P      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}

struct Identifiers
{
    static let LoginViewController          = "LoginViewController"
    static let SplashViewController         = "SplashViewController"
    static let ForgotPasswordViewController = "ForgotPasswordViewController"
    static let AgendaViewController         = "AgendaViewController"
    static let ProjectsViewController       = "ProjectsViewController"
    static let SideMenuViewController       = "SideMenuViewController"
    static let MainViewController           = "MainViewController"
    static let SnagListViewController       = "SnagListViewController"
    static let SnagDetailsViewController    = "SnagDetailsViewController"
    static let PermissionsViewController    = "PermissionsViewController"
    static let CustomCameraViewController   = "CustomCameraViewController"
    static let WelcomeViewController        = "WelcomeViewController"
    static let SyncViewController           = "SyncViewController"
    static let ProjectsNavID                = "ProjectsNavID"
    static let AgendaNavID                  = "AgendaNavID"
    static let SettingsNavID                = "SettingsNavID"
    static let AboutNavID                   = "AboutNavID"
    static let ProjectStatusNavID           = "ProjectStatusNavID"
    static let NotificationsViewController  = "NotificationsViewController"
    static let PropertyNotificationsViewController  = "PropertyNotificationsViewController"
    static let OtherNotificationsViewController  = "OtherNotificationsViewController"
    static let SettingsViewController       = "SettingsViewController"
    static let AboutViewController          = "AboutViewController"
    static let ProjectStatusViewController  = "ProjectStatusViewController"
    static let StatusSnagViewController     = "StatusSnagViewController"
    static let StatusDetailViewController   = "StatusDetailViewController"
    static let CustomVideoViewController    = "CustomVideoViewController"
    static let ChecklistViewController   = "ChecklistViewController"
}

let deviceType = "1" //1 for ios
let userType = "2" //User type is 2 for user app
let projectName = "HandOff"
let Version_name = UIDevice.current.systemVersion
let Company_name = "Apple"
let Model_name =  UIDevice.current.model
let iemi = UIDevice.current.identifierForVendor
let deviceOSVersion = NSString(string: UIDevice.current.systemVersion)
let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let versionBuildString = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
let userDefault = UserDefaults.standard
let appdelegate = UIApplication.shared.delegate as! AppDelegate

let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
let servicesStory = UIStoryboard(name: "Services", bundle: nil)
let navigationTitleName = "QUEUE"
let appTheamColor = "00FFB9"


//Global Dict
let additionalInfo = ["os_version":deviceOSVersion,"modelName":Model_name,"model_type":Model_name,"versionCode":versionBuildString!,"iemi":"iemi"] as [String : Any]


