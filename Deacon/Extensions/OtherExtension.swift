//
//  OtherExtension.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import Foundation
extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}

import Foundation
import UIKit

// MARK: - Protocol

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    
    enum Storyboard: String {
        case main = "Main"
        
        var filename: String {
            return rawValue
        }
    }
    
    // MARK: - Convenience Initializers
    
    convenience init(_ storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    // MARK: - Class Functions
    
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    // MARK: - View Controller Instantiation from Generics
    
    func instantiateViewC<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}



protocol NibLoaded {
    static func instantiate() -> Self
}

extension NibLoaded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        return Self(nibName: className, bundle: Bundle.main)
    }
}
extension UIViewController {
    func appNavigationWithBackButton(navigationTitle:String)  {
      //  self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back_button")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back_button")
        self.navigationController?.navigationBar.backgroundColor = AppColor.appNavigationSkyBlueColor
        navigationController?.navigationBar.tintColor = .white
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 50))
        titleLabel.text = navigationTitle
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = UIColor.clear
        navigationItem.titleView = titleLabel
    }
}
enum PickerStyle {
    case Date
    case Time
}
