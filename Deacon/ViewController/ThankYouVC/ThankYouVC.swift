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
        appNavigationWithBackButton(navigationTitle: "")
        addNavigationBackButton()
    }
    func addNavigationBackButton()  {
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem (image: UIImage(named: "back_button")!, style: .plain, target: self, action: #selector(navigationBackButtonAction))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.hidesBackButton = true
    }
    @objc func navigationBackButtonAction() {
        self.navigationController?.popToViewController(ofClass: HomePageVC.self)
    }
}
