//
//  ThankYouVC.swift
//  Deacon
//
//  Created by ABC on 12/07/21.
//

import UIKit

class ThankYouVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        appNavigationWithBackButton(navigationTitle: "Submit")
    }
}
